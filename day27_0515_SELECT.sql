SELECT * 
FROM EMPLOYEES;

SELECT first_name, 
       email, 
       hire_date
FROM employees;

SELECT job_id, 
        salary, 
        department_id 
FROM employees;

SELECT * 
FROM departments;

-- ����
-- �÷��� ��ȸ�ϴ� ��ġ���� * / + -
SELECT first_name, 
        salary, 
        salary + salary * 0.1 
FROM employees;

-- NULL
SELECT first_name, 
        commission_pct 
FROM employees;

-- AS
SELECT first_name AS �̸�, 
        last_name AS ��, 
        salary �޿�, 
        salary + salary * 0.1 �ѱ޿� 
FROM employees;

-- || ���ڿ� ����
-- ����Ŭ�� ���ڸ�''�� ǥ��
-- ���ڿ� �ȿ���' ����Ϸ��� '' -> ''' = '''s salary is $'
SElECT first_name || ' ' || last_name || '''s salary is $' || salary AS "Employees Details"
FROM employees;

-- DISTINCT �ߺ� ����
SELECT DISTINCT first_name, 
                department_id
FROM employees
ORDER BY department_id ASC; 

-- ROWID /
SELECT ROWID, 
        ROWNUM, 
        employee_id, 
        first_name
FROM employees;

-- WHERE ���� (����, �����, ��ҹ��� ����)
SELECT first_name, 
        job_id,
        department_id
FROM employees
WHERE JOB_ID='IT_PROG';

SELECT *
FROM employees
WHERE salary = 4800;

-- �� ������
SELECT first_name,
        salary, 
        hire_date
FROM employees
WHERE salary >= 15000
order by hire_date ASC;

-- ���� - BETWEEN A AND B
SELECT first_name,
        salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '08/01/01' AND '08/12/31';

SELECT * 
FROM employees
WHERE NOT salary >= 6000
ORDER BY salary ASC;

SELECT * 
FROM employees
where job_id = 'IT_PROG' AND salary >= 6000;

SELECT * 
FROM employees
where job_id = 'IT_PROG' OR salary >= 6000;

-- ���� �������� ������ ��������
SELECT * 
FROM employees
where job_id = 'IT_PROG' OR job_id = 'FI_MGR' AND salary >= 6000; //FI�� 6000�̻��� ��� OR IT_PROG

-- ���� ������ ����
SELECT * 
FROM employees
where (job_id = 'IT_PROG' OR job_id = 'FI_MGR') AND salary >= 6000; 

-- IN
SELECT employee_id,
        first_name,
        manager_id
FROM employees
WHERE manager_id IN(101, 102, 103 );

-- LIKE %, _
SELECT first_name,
        last_name,
        job_id,
        department_id
FROM employees
WHERE job_id LIKE 'IT%';

SELECT *
FROM employees
WHERE hire_date LIKE '%12%'
order by department_id asc;

SELECT *
FROM employees
WHERE hire_date LIKE '___05%';

SELECT *
FROM employees
WHERE email LIKE '_A%';

-- IS NULL / IS NOT NULL
SELECT * 
FROM employees
WHERE commission_pct IS NULL;

SELECT * 
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct ASC;

