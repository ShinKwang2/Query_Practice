USE SCOTT;

-- 부서가 없는 직원이 있다고 가정
INSERT INTO emp
VALUES (7777, 'SSAFY', 'MANAGER', 7839, '2022-09-13', 2000, NULL, NULL);

SELECT count(*) FROM emp;

SELECT ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- LEFT OUTER JOIN
SELECT e.ename, e.deptno, d.dname
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- RIGHT OUTER JOIN
SELECT d.dname, e.empno, e.ename
FROM emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- SELF JOIN
SELECT e1.ename, e1.mgr, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

SELECT e1.ename, e1.mgr, e2.ename
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;

-- Non-Equi JOIN
SELECT e.empno, e.ename, e.sal, sg.grade
FROM emp e, salgrade sg
WHERE e.sal BETWEEN sg.losal and sg.hisal;

SELECT e.empno, e.ename, e.sal, sg.grade
FROM emp e, salgrade sg
WHERE e.sal >= sg.LOSAL AND e.sal <= sg.HISAL;


