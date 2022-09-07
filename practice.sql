USE scott;

-- 모든 사원 정보 검색
SELECT * FROM emp;

-- 사원이 근무하는 부서 번호
SELECT DISTINCT deptno AS "부서번호"
FROM emp;

-- 사원의 이름, 부서 번호, 업무 조회
SELECT ename, deptno, job FROM emp;

-- 사원의 이름, 사번, 급여 * 12(연봉), 업무 조회
SELECT ename AS 이름, empno AS 사번, sal * 12 AS 연봉, job as "업 무"
FROM emp;

-- 사원의 이름, 사번, 커미션, 급여, 커미션 포함 급여 조회
SELECT ename 이름, empno AS "사번", comm 커미션,
		sal AS 급여, sal + comm AS "커미션 포함 급여", sal + IFNULL(comm, 0) AS "커미션 포함급여2"
FROM emp;

-- CASE FUNCTION
SELECT empno, ename, sal,
	CASE
		WHEN sal >= 5000 THEN "고액연봉"
        WHEN sal >= 2000 THEN "평균연봉"
        ELSE "저액연봉"
	END AS "연봉등급"
FROM emp;

-- 부서 번호가 30인 사원 중 급여가 1500 이상인 사원의 이름, 급여, 부서번호 조회
SELECT ename, sal, deptno
FROM emp
WHERE deptno = 30 AND sal >= 1500;

-- 부서 번호가 20 또는 30인 부서에서 근무하는 사원의 사번, 이름, 부서번호 조회
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30 OR deptno = 20;

-- 부서 번호가 20, 30이 아닌 부서에서 근무하는 사원의 사번, 이름, 부서번호 조회
SELECT empno, ename, deptno
FROM emp
WHERE deptno != 30 AND deptno <> 20;

SELECT empno, ename, deptno
FROM emp
WHERE NOT (deptno = 30 OR deptno = 20);

-- 업무가 MANAGER, ANALYST, PRESIDENT 인 사원의 이름, 사번, 업무조회
SELECT ename, empno, job
FROM emp
WHERE job IN ('MANAGER', 'ANALYST', 'PRESIDENT');

-- 부서번호가 10, 20이 아닌 사원의 사번, 이름, 부서번호 조회
SELECT empno, ename, deptno
FROM emp
WHERE deptno NOT IN (10, 20);

-- 급여가 2000 이상 3000 이하인 사원의 사번, 이름, 급여조회
SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- 입사일이 1981년인 직원의 사번, 이름, 입사일 조회
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';

-- 이름이 'A', 'B', 'C'로 시작하는 직원의 사번, 이름조회
SELECT empno, ename
FROM emp
WHERE ename BETWEEN 'A' AND 'D';
-- 문자열은 숫자와 다르게 A~C를 하기 위해선 'A' AND 'D'로 해야한다.

-- 커미션이 NULL인 사원의 사번, 이름, 커미션 조회
SELECT empno, ename, comm
FROM emp
-- WHERE comm = NULL;
WHERE comm IS NULL;

-- 커미션이 NULL 이 아닌 사원의 사번, 이름, 업무, 커미션 조회
SELECT empno, ename, job, comm
FROM emp
WHERE comm IS NOT NULL;

-- 이름이 M으로 시작하는 사원의 사번, 이름 조회
SELECT empno, ename
FROM emp
WHERE ename LIKE 'M%';

-- 이름에 E가 포함된 사원의 사번, 이름 조회
SELECT empno, ename
FROM emp
WHERE ename LIKE '%E%';

-- 이름의 세번째 알파벳이 'A'인 사원의 사번, 이름 조회
SELECT empno, ename
FROM emp
WHERE ename LIKE '__A%';

-- 모든 직원의 모든 정보를 이름을 기준으로 내림차순 정렬
SELECT *
FROM emp
ORDER BY ename DESC;

-- 모든 사원의 사번, 이름, 급여를 조회 (급여 내림차순)
SELECT empno, ename, sal
FROM emp
ORDER BY sal DESC;

-- 20, 30번 부서에 근무하는 사원의 사번, 이름, 부서번호, 급여조회 (부서별 오름차순, 급여순 내림차순)
SELECT empno, ename, deptno, sal
FROM emp
WHERE deptno IN (20, 30)
ORDER BY deptno, sal DESC;



-- ----------------------- MySQL 내장함수 ----------------------------

-- 2의 3제곱
SELECT POW(2, 3) AS "2^3"
FROM dual;

-- 8 나누기 3의 나머지
SELECT MOD(8, 3) AS "8 % 3";

-- 최대값, 최소값
SELECT greatest(8,17,86,17,100,77,999,2,13,31,97), least(8,17,86,17,100,77,999,2,13,31,97);

-- 반올림
SELECT round(1526.159), round(1526.159, 0), round(1526.159, 1), round(1526.159, 2), round(1526.159, 3);

-- ASCII 코드 값 얻기
SELECT ascii('0'), ascii('A'), ascii('a');

-- CONCAT 메소드를 써보자.
SELECT CONCAT('PRESIDENT의 이름은', ename, ' 입니다.') AS 소개
FROM emp
WHERE job = 'PRESIDENT';

-- 이름의 길이가 5인 직원의 이름을 조회
SELECT ename
FROM emp
WHERE length(ename) = 5;

-- 김싸피
SELECT length('김싸피'), char_length('김싸피');
SELECT length('🥕'), char_length('🥕');

-- 문자열 변경
SELECT replace('Hello abc abc', 'abc', 'ssafy');

-- 문자열 인덱스
SELECT instr('Hello SSAFY', 'SSAFY');
-- idx 가 6이 아니라 7, 다른 프로그래밍 언어와는 다르게 1부터 시작

-- 모든 직원의 이름 3자리 조회
SELECT substr(ename, 1, 3)
FROM emp;

-- LPAD RPAD
SELECT LPAD('SSAFY', 10, '*'), RPAD('SSAFY', 10, '*');

-- REVERSE
SELECT REVERSE('HELLO SSAFY!');
SELECT REVERSE('우영우역삼역기러기인도인토마토별똥별스위스');


