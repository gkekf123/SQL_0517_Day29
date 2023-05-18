--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
                     FROM employees);
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary)
                     FROM employees);
---EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
                     FROM employees
                     WHERE job_id = 'IT_PROG');
--���� 2.
---DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
SELECT * 
FROM employees
WHERE department_id > ANY (SELECT department_id
                           FROM departments
                           WHERE manager_id = 100)
;
--���� 3.
---EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
SELECT * 
FROM employees
WHERE manager_id > ANY (SELECT manager_id
                        FROM employees
                        WHERE first_name = 'Pat')
;
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
SELECT * FROM employees WHERE first_name = 'James';

SELECT * 
FROM employees
WHERE manager_id = 120 OR manager_id = 121;

SELECT * 
FROM employees
WHERE manager_id IN (SELECT manager_id
                     FROM employees
                     WHERE first_name = 'James')
;

--���� 4.
---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
SELECT * 
FROM (SELECT first_name,
             ROWNUM  AS rn
      FROM(SELECT * 
           FROM employees
           ORDER BY first_name DESC))
WHERE rn >= 41 AND rn <=50;

--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ,
--�Ի����� ����ϼ���.
SELECT * FROM employees;
SELECT * 
FROM (SELECT first_name,
             ROWNUM  AS rn,
             employee_id,
             hire_date
      FROM(SELECT * 
           FROM employees
           ORDER BY first_name DESC))
WHERE rn >= 31 AND rn <= 40;

--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
SELECT e.employee_id,
       CONCAT(e.first_name, e.last_name),
       d.department_id,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON d.department_id = e.employee_id
ORDER BY e.employee_id;

--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT CONCAT(e.first_name, e.last_name) AS �̸�,
       e.employee_id AS �������̵�,
      (SELECT department_name
       FROM departments d
       WHERE d.department_id = e.department_id) AS �μ����̵�,
       (SELECT department_id
       FROM departments d
       WHERE d.department_id = e.department_id) AS �μ���
FROM employees e
ORDER BY e.employee_id;
       
--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT * FROM departments;
SELECT * FROM locations;
SELECT d.*,
       l.location_id,
       street_address,
       postal_code,
       city
FROM departments d
LEFT JOIN LOCATIONS l
ON d.location_id = l.location_id
ORDER BY department_id;

--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT d.*,
      (SELECT street_address
       FROM locations l
       WHERE d.location_id = l.location_id) AS �ּ�,
       (SELECT postal_code
       FROM locations l
       WHERE d.location_id = l.location_id) AS �����ȣ,
       (SELECT city
       FROM locations l
       WHERE d.location_id = l.location_id) AS ����
FROM departments d
ORDER BY d.department_id;

--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����


--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���


--���ΰ� ��������
--���� 12.
--employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.

--���� 13.
----EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���

--���� 14
----DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
----�ο��� ���� �������� �����ϼ���.
----����� ���� �μ��� ������� ���� �ʽ��ϴ�

--���� 15
----�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���
----�μ��� ����� ������ 0���� ����ϼ���

--���� 16
---���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���