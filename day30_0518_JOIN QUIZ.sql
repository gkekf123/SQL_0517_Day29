--���� 1.
---EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
---EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
-- INNER
SELECT COUNT(*)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
-- LEFT
SELECT COUNT(*) 
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
-- RIGHT
SELECT COUNT(*) 
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
-- FULL
SELECT COUNT(*) 
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;

--���� 2.
---EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
SELECT e.first_name || ' ' || e.last_name, --CONCAT(e.first_name, ' ', e.last_name)
       d.department_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;

--���� 3.
---EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��
SELECT e.first_name || ' ' || e.last_name AS NAME,
       j.job_title
FROM employees e
JOIN jobs j
USING (job_id)  --ON e.job_id = j.job_id
ORDER by NAME;

--���� 4.
----JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
SELECT * 
FROM jobs a
LEFT JOIN job_history b
ON a.job_id = b.job_id;

--���� 5.
----Steven King�� �μ����� ����ϼ���.
SELECT e.first_name || ' ' || e.last_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE first_name = 'Steven' AND last_name = 'King';

--���� 6.
----EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
SELECT e.department_id,
       d.department_id
FROM employees e
CROSS JOIN departments d;

--���� 7.
----EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�,
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
SELECT e.first_name || ' ' || e.last_name AS �̸�,
       e.employee_id AS �����ȣ,
       e.salary AS �޿�,
       e.job_id,
       d.department_name AS �μ���,
       l.city AS �ٹ���
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations l ON l.location_id = d.location_id
WHERE e.job_id = 'SA_MAN';
--���� 8.
---- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.
SELECT *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title IN ('Stock Manager', 'Stock Clerk');

--���� 9.
---- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
SELECT department_name
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
WHERE employee_id IS NULL;

--���� 10.
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
SELECT e1.first_name || ' ' || e1.last_name AS employee,
       e2.first_name || ' ' || e2.last_name AS manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;

--���� 11.
----EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
----�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
SELECT * FROM employees;
SELECT e1.first_name || ' ' || e1.last_name AS employee,
       e2.first_name || ' ' || e2.last_name AS manager,
       e2.salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;