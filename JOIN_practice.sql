USE `SCOTT`;

-- 카타시안 곱 
SELECT empno, ename, job
FROM emp;

SELECT deptno, dname
FROM dept;

SELECT empno, ename, job, emp.deptno, dname
FROM emp, dept;

-- WHERE 사용하여 유의미하게 데이터를 뽑아야 카타시안 곱이 생기지 않는다.
SELECT empno, ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;


-- 사번 7788인 사원의 이름, 업무, 부서번호, 부서이름 조회
SELECT ename, job, deptno
FROM emp
WHERE empno = 7788;

SELECT dname
FROM dept
WHERE deptno = 20;


-- 조인을 이용하여 작성
SELECT ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND empno = 7788;

-- INNER JOIN 키워드 사용해보자.
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.empno = 7788;

SELECT ename, job, deptno, dname
FROM emp
INNER JOIN dept
USING (deptno)
WHERE empno = 7788;

-- -----------------OUTER JOIN--------------------
INSERT INTO emp
VALUES (4168, "이해건", "MANAGER", 7839, "2022-09-13", 5000, NULL, NULL);

-- 동등조인으로 이름, 부서번호, 부서 이름을 가져와
SELECT e.ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;


-- 한쪽에 기준을 주고 다른 테이블 붙이기
-- 없으면 없는 데로 
-- 모든 사원을 기준으로(LEFT OUTER JOIN)
SELECT e.ename, e.deptno, d.dname
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- 부서 테이블을 기준으로(RIGHT OUTER JOIN)
SELECT e.ename, e.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- 셀프 조인(SELF JOIN)
-- 모든 사원번호, 이름, 매니저 번호, 매니저 이름 
SELECT e1.empno, e1.ename, e1.mgr, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno
ORDER BY e2.ename;

-- INNER JOIN 이라는 키워드를 사용해보자
SELECT e1.empno AS "사번", e1.ename AS 사원이름, e2.empno AS "매니저 번호", e2.ename AS "매니저 이름"
FROM emp e1
INNER JOIN emp e2
ON e1.mgr = e2.empno;

-- KING 이 안나왔다. 나오게 하려면? (OUTER JOIN)
SELECT e1.empno AS "사번", e1.ename AS 사원이름, e2.empno AS "매니저 번호", e2.ename AS "매니저 이름"
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;


-- 비 동등 조인(Non-Equi JOIN)
-- 모든 사원의 사번, 이름, 급여, 급여등급을 조회하고 싶다.
SELECT e.empno, e.ename, e.sal AS "급여", sg.grade AS "급여등급"
FROM emp e, salgrade sg
WHERE e.sal BETWEEN sg.LOSAL AND sg.HISAL
ORDER BY sg.grade DESC, e.sal DESC;


SELECT e.empno, e.ename, e.sal AS "급여", sg.grade AS "급여등급"
FROM emp e, salgrade sg
WHERE e.sal >= sg.LOSAL AND e.sal <= sg.HISAL
ORDER BY sg.grade DESC, e.sal DESC;


