----- �׷� �Լ� : ���� �࿡ ���Ͽ� ���� ��� -----

-- AVG, SUM, MIN, MAX, COUNT --
SELECT AVG(salary),
       SUM(salary),
       MIN(salary),
       MAX(salary),
       COUNT(salary)
FROM employees;

SELECT MIN(hire_date),
       MAX(hire_date)
FROM employees;

SELECT MIN(first_name),
       MAX(first_name)
FROM employees;

-- COUNT(�÷�) : NULL�� �ƴ� ������ ����
SELECT COUNT(first_name)
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

-- COUTN(*) : ��ü ���� ����
SELECT COUNT(*)
FROM employees;

-- error)�׷��Լ��� �Ϲ��÷��� ���ÿ� ����� �� ���� - ����Ŭ��
SELECT first_name, SUM(salary)
FROM employees;

-- GROUP BY --
SELECT department_id, 
       AVG(salary),
       SUM(salary),
       COUNT(*)
FROM employees
GROUP BY department_id;

-- ������ ��(�׷����� ��� �� �÷���, SELECT���� ����Ѵ�)
SELECT department_id, 
       first_name
FROM employees
GROUP BY department_id;

-- 2�� �̻��� �׷�ȭ
SELECT department_id,
       job_id,
       AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- �׷��Լ��� WHERE���� ������ �� ����
SELECT job_id,
       AVG(salary)
FROM employees
WHERE department_id = 50 -- �ȵ� AVG(salary) >= 1000 -> HAVING�� �ذ�
GROUP BY job_id;

-- HAVING --
SELECT job_id,
       AVG(salary)
FROM employees
GROUP BY job_id
HAVING  AVG(salary) >= 10000;

SELECT department_id,
       COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30;

-- ���� 1
SELECT job_id,
       SUM(salary),
       SUM(NVL(commission_pct, 0))
FROM employees
WHERE job_id NOT IN ('IT_PROG')
GROUP BY job_id
HAVING SUM(salary) >= 20000
ORDER BY SUM(salary) DESC;

-- ���� 2
-- �μ� ���̵� 50�� �̻��� �μ��� �׷�ȭ ��Ű�� �׷� ��� �޿� 5000�̻� ���
SELECT department_id,
       AVG(NVL(salary, 0))
FROM employees
WHERE department_id >= '50'
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

-- ROLLUP, CUBE, GROUPING --

-- ROLLUP : �� �׷��� �Ѱ踦 �Ʒ��� ���
SELECT department_id,
      TRUNC(AVG(salary))
FROM employees
GROUP BY ROLLUP(department_id);

SELECT department_id,
       job_id,
       TRUNC(AVG(salary))
FROM employees
GROUP BY ROLLUP(department_id, job_id);

-- CLUB : 
SELECT department_id,
      TRUNC(AVG(salary))
FROM employees
GROUP BY CUBE(department_id);

SELECT department_id,
       job_id,
       TRUNC(AVG(salary))
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id, job_id;

-- GROUPING : �׷����� �����Ǹ� 0��ȯ, ROLLUP OR CUBE�� ��������� 1��ȯ
SELECT department_id,
       job_id,
       DECODE(GROUPING(job_id), 1, '�Ұ�',job_id), 
       GROUPING(department_id),
       GROUPING(job_id),
       SUM(salary),
       COUNT(*)
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id;

SELECT * FROM employees;

--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
SELECT job_id,
       COUNT(*),
       AVG(salary)
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
SELECT TO_CHAR(hire_date, 'YY'),
       COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY  TO_CHAR(hire_date, 'YY') ASC;

--���� 3.
--�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���
SELECT department_id,
       TRUNC(AVG(salary))
FROM employees
WHERE salary >= 1000
GROUP BY department_id
HAVING TRUNC(AVG(salary)) >= 2000
ORDER BY AVG(salary) ASC;

--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
SELECT department_id,
       TRUNC(AVG(salary + salary * commission_pct), 2),
       SUM(salary + salary * commission_pct),
       COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

--���� 5.
--������ ������, ���հ踦 ����ϼ���
SELECT DECODE(GROUPING (job_id), 1, '�հ�', job_id),
       SUM(salary)
FROM employees
GROUP BY ROLLUP(job_id);

--���� 6.
--�μ���, JOB_ID�� �׷��� �Ͽ� ��Ż, �հ踦 ����ϼ���.
--GROUPING() �� �̿��Ͽ��Ұ� �հ踦 ǥ���ϼ���
SELECT DECODE(GROUPING(department_id), 1, '�հ�', department_id) AS DEPARTMENT_ID,
       DECODE(GROUPING(job_id), 1, '�Ұ�', job_id) AS JOB_ID,
       COUNT(*) AS TOTAL,
       SUM(salary) AS SUM
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY SUM;
