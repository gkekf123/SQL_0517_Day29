-- ���ڿ� �Լ�
-- LOWER(), INITCAP(), UPPER()
SELECT LOWER('HELLO'), INITCAP('HELLO'), UPPER('HELLO') FROM DUAL; // ��¥ ���̺�

SELECT LOWER(first_name), INITCAP(first_name), UPPER(first_name) FROM employees;

-- �Լ��� WHERE������ ����
SELECT first_name FROM employees WHERE UPPER(first_name) = 'STEVEN';

-- LENTH() : ����, INSTR() : ����ã��
SELECT first_name, LENGTH(first_name), INSTR(first_name, 'e') FROM employees;

-- SUBSTR() : ���ڿ� �ڸ���, CONCAT() : ���ڿ� ��ġ��
SELECT first_name, SUBSTR(first_name, 1, 3) FROM employees; // 1��°���� 3���ڸ� �ڸ�
SELECT first_name, CONCAT(first_name, last_name)FROM employees; //first_name || last_name�� ����ǥ��

-- LPAD() : ���� ä���, RPAD() : ������ ä���
SELECT LPAD('HELLO', 10, '*') FROM DUAL; // 10ĭ ��� ���ʺ��� ä���
SELECT LPAD(salary, 10, '*') FROM employees;
SELECT RPAD(salary, 10, '*') FROM employees;

-- LTRIM() : ���� ����, RTRIM() : ������ ����, RTIM() : ���� ����
SELECT LTRIM('     HELLO') FROM DUAL;
SELECT LTRIM(first_name, 'A') FROM employees; // ���ʿ� ó�� �߰ߵǴ� ���� A����
SELECT RTRIM(first_name, 'n') FROM employees; // �����ʿ��� �Է� ���� ����
SELECT TRIM('    HELLO ') AS RESULT FROM DUAL;

-- REPLACE() : ���ڿ� ����
SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYE') FROM DUAL;
SELECT REPLACE('HELLO WORLD ~!', ', ', '') AS RESULT FROM DUAL; -- ��� ���� ����

-- ��ø
SELECT REPLACE('HELLO WORLD ~!', 'HELLO', 'BYE') FROM DUAL;
SELECT REPLACE(REPLACE('HELLO WORLD ~!', 'HELLO', 'BYE'), ' ', '') AS RESULT FROM DUAL;

-- ���� �Լ� --
-- ROUND() : �ݿø�
SELECT ROUND(45.523, 2), 
        ROUND(45.523), 
        ROUND(45.523, -1) 
FROM DUAL;

-- TRUNC() : ����
SELECT TRUNC(45.523, 2), 
        TRUNC(45.523), 
        TRUNC(45.523, -1) 
FROM DUAL;

-- CEIL() : �ø�, FLOOR() : ����
SELECT CEIL(3.14), 
        FLOOR(3.14)
FROM DUAL;

-- MOD() : ������
SELECT 5 / 3 AS ��, 
        MOD(5, 3) AS ������ 
FROM DUAL;

-- ��¥ �Լ� --
SELECT SYSDATE,
        SYSTIMESTAMP
FROM DUAL;

-- ��¥ ���� --
-- +10��
SELECT SYSDATE + 10
FROM DUAL;
-- -10��
SELECT SYSDATE - 10
FROM DUAL;
-- �� ��
SELECT SYSDATE - hire_date
FROM employees;
-- �� 
SELECT (SYSDATE - hire_date) / 7 AS "WEEKS"
FROM employees;
-- ��
SELECT TRUNC((SYSDATE - hire_date) / 365) * 12 AS "MONTH"
FROM employees;
-- ��
SELECT (SYSDATE - hire_date) / 365 AS "YEARS"
FROM employees;

-- ��¥�� �ݿø� --
SELECT ROUND(SYSDATE)
FROM DUAL;
-- �ش� �� �� �Ͽ��Ϸ�
SELECT ROUND(SYSDATE, 'DAY')
FROM DUAL;
-- ���� ���� �ݿø�
SELECT ROUND(SYSDATE, 'MONTH')
FROM DUAL;
-- �⿡ ���� �ݿø�
SELECT ROUND(SYSDATE, 'YEAR')
FROM DUAL;

-- ��¥�� ���� --
SELECT TRUNC(SYSDATE)
FROM DUAL;
-- �ش� �� �� �Ͽ��Ϸ� ����
SELECT TRUNC(SYSDATE, 'DAY')
FROM DUAL;
-- ���� ���� ����
SELECT TRUNC(SYSDATE, 'MONTH')
FROM DUAL;
-- �⿡ ���� ����
SELECT TRUNC(SYSDATE, 'YEAR')
FROM DUAL;

SELECT first_name, TO_CHAR(hire_date, 'MM/YY') AS Month_hired
FROM employees
WHERE first_name = 'Steven';

----- ����ȯ �Լ� -----

-- �ڵ� ����ȯ
SELECT * 
FROM employees 
WHERE department_id = '30';

--
SELECT SYSDATE -5,
        SYSDATE - '5'
FROM employees;

-- ���� ����ȯ --

-- TO_CHAR(��¥, ��¥ ����)

-- ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS')
FROM DUSL;

-- ����
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24/MI/SS')
FROM DUAL;

-- ���˹��ڰ� �ƴ� ���� ""�� ���� �ش�
SELECT TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��"') 
FROM DUAL;

SELECT TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees;

-- TO_CHAR(����, ���� ����) --

SELECT TO_CHAR(200000, '$999,999,999')
FROM DUAL;

-- �Ҽ� �� �ڸ� ǥ��
SELECT TO_CHAR(200000, '999999.999')
FROM DUAL;

-- ���� ȭ��
SELECT TO_CHAR(salary * 1300, 'L999,999,999')
FROM employees;

-- �ڸ����� 0���� ä��
SELECT TO_CHAR(salary * 1300, 'L0999,999,999')
FROM employees;

-- TO_NUMBER(����, ���� ����) --

-- �ڵ� ����ȯ
SELECT '3.14' + 2000
FROM DUAL;

-- ����� ����ȯ
SELECT TO_NUMBER('3.14') + 2000
FROM DUAL;

-- ����� ����ȯ
-- ERROR
SELECT '$3,300' + 2000 
FROM DUAL;

-- CORRECT
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 
FROM DUAL;

-- TO_DATE(����, ��¥ ����) --

-- ERROR
SELECT SYSDATE - '2023-05-16'
FROM DUAL;

-- CORRECT
SELECT SYSDATE - TO_DATE('2023-05-16', 'YYYY-MM-DD')
FROM DUAL;

SELECT SYSDATE - TO_DATE('2023-05-16 11:31:23', 'YYYY-MM-DD HH:MI:SS')
FROM DUAL;

-- �Ʒ� ���� YYYY��MM��DD�� ���·� ���
-- SELECT '20050105' FROM DUAL;
SELECT TO_CHAR(TO_DATE('20050105', 'YYYYMMDD'), 'YYYY"��"MM"��"DD"��"')
FROM DUAL;

-- �Ʒ� ���� ���� ��¥�� �ϼ� ���̸� ���Ͻÿ�
-- SELECT '2005��01��05��' FROM DUAL
SELECT SYSDATE - TO_DATE('2005��01��05��', 'YYYY"��"MM"��"DD"��"')
FROM  DUAL;

-- NULL���� ���� ��ȯ NVL(�÷�, NULL�� ��� ó��) --

SELECT NVL(NULL, 0)
FROM DUAL;

--
SELECT first_name, 
        commission_pct
FROM employees;

-- NULL ���� -> NULL
SELECT first_name, 
        commission_pct * 100
FROM employees;

--
SELECT first_name, 
        NVL(commission_pct, 0) * 100
FROM employees;

-- NVL2(�÷�, NULL�� �ƴѰ��ó��, NULL�� ���ó��) --

SELECT NVL2(NULL, 'NULL�̾ƴϴ�', 'NULL�̴�')
FROM DUAL;

-- �� ������ ���ΰ�?
SELECT  first_name,
        salary,
        commission_pct,
        NVL2(commission_pct, salary + (salary * commission_pct), 
        salary) AS �޿�
FROM employees;

-- DECODE() : ELSE IF���� ��ü�ϴ� �Լ� --

SELECT DECODE('D', 'A', 'A�Դϴ�', 
                   'B', 'B�Դϴ�', 
                   'C', 'C�Դϴ�',
                   'ABC�� �ƴմϴ�')
FROM DUAL;

--
SELECT job_id, 
    DECODE(job_id, 'IP_PROG', salary * 0.3,
                   'FI_MGR', salary * 0.2,
                   salary)
FROM employees;

-- CASE WHEN THEN ELSE --

-- ��� 1
SELECT job_id, 
       salary,
       CASE job_id WHEN 'IT_PROG' THEN salary * 1.10
                   WHEN 'FI_MGE' THEN salary * 1.15
                   WHEN 'FI_ACCOUNT' THEN salary * 1.20
                   ELSE salary
                   END AS REVISED_SALARY
FROM employees;

-- ��� 2
SELECT job_id, 
       salary,
       CASE WHEN job_id = 'IT_PROG' THEN salary * 1.10
            WHEN job_id = 'FI_MGE' THEN salary * 1.15
            WHEN job_id = 'FI_ACCOUNT' THEN salary * 1.20
            ELSE salary
            END AS REVISED_SALARY
FROM employees;

-- COALESCE(A, B) -- NVL�̶� ����(NULL�� ��쿡 0���� ġȯ) --

SELECT COALESCE(commission_pct, 0)
FROM employees;

-- ��������
SELECT * FROM employees;

-- ���� 1
SELECT employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       hire_date AS �Ի�����,
       TRUNC((SYSDATE - hire_date) / 365) AS �ټӳ�� 
FROM employees
WHERE TRUNC((SYSDATE - hire_date) / 365) >= 10
ORDER BY �ټӳ�� DESC;

-- ���� 2
SELECT first_name || ' ' || last_name AS NAME,
       manager_id,
       CASE manager_id WHEN 100 THEN '���'
                       WHEN 120 THEN '����'
                       WHEN 121 THEN '�븮'
                       WHEN 122 THEN '����'
                       ELSE '�ӿ�'
                       END AS ����
FROM employees
WHERE department_id = 50
ORDER BY manager_id ASC;

-- UNION : ������ --
SELECT first_name,
       hire_date
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT first_name,
       hire_date
FROM employees
WHERE department_id = 20;

-- UNION ALL : ������ --
SELECT first_name,
       hire_date
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT first_name,
       hire_date
FROM employees
WHERE department_id = 20;

-- INTERSECT : ������ --
SELECT first_name,
       hire_date
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT first_name,
       hire_date
FROM employees
WHERE department_id = 20;

-- MINUS : ������ --
SELECT first_name,
       hire_date
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT first_name,
       hire_date
FROM employees
WHERE department_id = 20;

SELECT 'ȫ�浿', TO_CHAR(SYSDATE) FROM DUAL
UNION ALL
SELECT '�̼���', '05/01/01' FROM DUAL
UNION ALL
SELECT 'ȫ����', '06/06/06' FROM DUAL
UNION ALL
SELECT last_name, TO_CHAR(hire_date) FROM employees;

-- �м� �Լ� �࿡ ���� ����� ����ϴ� ���, OVER()�� �Բ� ���ȴ� --
-- window���� SQLD �ܰ� ����
SELECT salary, 
       RANK() OVER(ORDER BY salary DESC) AS �ߺ�����,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS �ߺ�����X,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS �����͹�ȣ,
       COUNT(*)OVER(), -- ��ü ������ ����
       ROWNUM AS ��ȸ���� -- ��ȸ�� �Ͼ ����
FROM employees;


