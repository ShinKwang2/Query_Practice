USE `SCOTT`;

-- 사번이 7788인 사원의 부서 이름을 조회하고 싶다.
SELECT deptno
FROM emp
WHERE empno = 7788;

SELECT dname
FROM dept
WHERE deptno = 20;

-- 서브쿼리 이용
SELECT dname
FROm dept
WHERE deptno = (SELECT deptno FROM emp WHERE empno = 7788);

-- 1. 매니저의 이름이 KING인 사원의 사번, 이름, 부서번호, 업무
SELECT empno
FROM emp
WHERE ename = "KING";

SELECT empno, ename, deptno, job
FROM emp
WHERE mgr = (SELECT empno
			 FROM emp
			 WHERE ename = "KING");
             
-- 2. 7566 사원보다 급여를 많이 받는 사원의 이름, 급여를 조회
-- 7566번의 급여
SELECT sal
FROM emp
WHERE empno = 7566;

SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal
			 FROM emp
			 WHERE empno = 7566);
             
-- 3. 20번 부서의 평균 급여보다 급여가 많은 사원의 사번, 이름, 업무, 급여조회
SELECT AVG(sal)
FROM emp
WHERE deptno = 20;

SELECT empno, ename, job, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
			 FROM emp
			 WHERE deptno = 20);
             
-- 4. 업무가 'TURNER'와 같고 사번 7934인 직원보다 급여가 많은 사원의 사번, 이름, 업무를 조회
SELECT job
FROM emp
WHERE ename = "TURNER";

SELECT sal
FROM emp
WHERE empno = 7934;

SELECT empno, ename, job
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = "TURNER")
AND sal > (SELECT sal FROM emp WHERE empno = 7934);
-- AND ename != "TURNER";


-- 다중행 IN / ANY / ALL
-- 5. 업무가 SALESMAN 인 직원들 중 최소 한 명 이상보다 많은 급여를 받는 사원의 이름, 급여, 업무를 조회
SELECT sal
FROM emp
WHERE job = 'SALESMAN';
-- > ANY (최소값보다는 커야해)	
SELECT ename, sal, job
FROM emp
WHERE sal > ANY (SELECT sal
				 FROM emp
				 WHERE job = 'SALESMAN');
 
-- < ANY (최대값보다는 작아야 해)
SELECT ename, sal, job
FROM emp
WHERE sal < ANY (SELECT sal
				 FROM emp
				 WHERE job = 'SALESMAN');
                 
-- 6. 업무가 'SALESMAN'인 모든 직원보다 급여(커미션포함)를 많이 받는 사원의 이름, 급여, 업무, 입사일, 부서번호 조회
SELECT sal + IFNULL(comm, 0)
FROM emp
WHERE job = 'SALESMAN';

-- > ALL 최대값보다 큼 / < ALL 최소값보다 작음
SELECT ename, sal + IFNULL(comm, 0) "급여", job, hiredate, deptno
FROM emp
WHERE sal + IFNULL(comm, 0) > ALL (SELECT sal + IFNULL(comm, 0)
								   FROM emp
								   WHERE job = 'SALESMAN');
                                   
-- MIN? MAX? 로 위 쿼리를 만들 수 있지 않을까?
SELECT ename, sal + IFNULL(comm, 0) "급여", job, hiredate, deptno
FROM emp
WHERE sal + IFNULL(comm, 0) > (SELECT MAX(sal + IFNULL(comm, 0)) 
							   FROM emp
                               WHERE job = 'SALESMAN');


-- 7. 직원이 최소 한명이라도 근무하는 부서의 부서번호, 부서이름, 위치
SELECT DISTINCT deptno
FROM emp;

SELECT deptno, dname, loc
FROM dept
WHERE deptno IN (SELECT DISTINCT deptno
				 FROM emp);
                 

-- 다중 열
-- 8. 이름이 FORD인 사원과 매니저 및 부서가 같은 사원의 이름, 매니저 번호, 부서번호를 조회
SELECT mgr, deptno
FROM emp
WHERE ename = 'FORD';

SELECT ename, mgr, deptno
FROM emp
WHERE (mgr, deptno) = (SELECT mgr, deptno
					   FROM emp
                       WHERE ename = 'FORD')
AND ename <> 'FORD';
-- AND ename != 'FORD';


-- 9. 각 부서별 / 입사일이 가장 빠른 / 사원의 사번, 이름, 부서번호, 입사일을 조회
SELECT IFNULL(deptno, '대기발령') AS '부서', MIN(hiredate)
FROM emp
GROUP BY deptno;

SELECT empno, ename, deptno, hiredate
FROM emp
WHERE (deptno, hiredate) IN (SELECT IFNULL(deptno, '대기발령') AS '부서', MIN(hiredate)
							 FROM emp
							 GROUP BY deptno);
                             

-- 상호연관 서브쿼리
-- 조인과 비교해볼 것(속도 등)
-- 10. 소속 부서의 평균 급여보다 많은 급여를 받는 사원의 이름, 급여, 부서번호, 입사일, 업무를 조회
SELECT ename, sal, deptno, hiredate, job
FROM emp e
WHERE sal > (SELECT AVG(sal) 
			 FROM emp
			 WHERE deptno = e.deptno);
             
             
             
-- 인라인 뷰(FROM 절에 서브쿼리)
-- 11. 모든 사원의 평균급여보다 적게 받는 사원들과 같은 부서에서 근무하는 사원의 사번, 이름, 급여, 부서번호를 조회

SELECT AVG(sal)
FROM emp;

SELECT DISTINCT deptno
FROM emp
WHERE sal < (SELECT AVG(sal) FROM emp);

SELECT e.empno, e.ename, e.sal, e.deptno
FROM emp e, (SELECT DISTINCT deptno FROM emp WHERE sal < (SELECT AVG(sal) FROM emp)) AS d
WHERE e.deptno = d.deptno;

-- 12. 모든 사원에 대하여 사원의 이름, 부서번호, 급여, 사원이 소속된 부서의 평균 급여를 조회
-- (단, 이름 오름차순)
SELECT deptno, AVG(sal) AS avgsal
FROM emp
GROUP BY deptno;

SELECT e.ename, e.deptno, e.sal, d.avgsal
FROM emp e, (SELECT deptno, AVG(sal) AS avgsal
			 FROM emp
			 GROUP BY deptno) d
WHERE e.deptno = d.deptno
ORDER BY e.ename;


-- 스칼라 서브쿼리
-- 13. 사원의 이름, 부서번호, 급여, 소속부서의 평균 급여를 조회
SELECT ename, deptno, sal, (SELECT AVG(sal) FROM emp WHERE deptno = e.deptno) AS avgsal
FROM emp e;

-- 14. 부서번호가 10인 부서의 총 급여, 20인 부서의 평균 급여, 30인 부서의 최고, 최저 급여


-- 15. 모든 사원의


-- 16.


-- 테이블을 카피
CREATE TABLE emp_copy
(SELECT * FROM emp);

SELECT * FROM emp_copy;

-- 구조만 가져오기
CREATE TABLE emp_blank
(SELECT * FROM emp WHERE 1 = 0);

INSERT INTO emp_blank
(SELECT * FROM emp WHERE deptno = 30);

SELECT * FROM emp_blank;

