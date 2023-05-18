SELECT * FROM info;
SELECT * FROM auth;

----- INNER JOIN -----

-- ���� �� �ִ� �����Ͱ� ������ �ȳ��´�
SELECT * 
FROM info INFO INNER JOIN auth ON info.auth_id = auth.auth_id;

-- ���ϴ� �÷��鸸, auth_id�� �Ѵ� �ֱ� ������ ���� ���̺��� ������ �ȴ�
SELECT id,
       title,
       auth.auth_id, --info.auth_id
       name
FROM info INFO INNER JOIN auth ON info.auth_id = auth.auth_id;

-- ���̺� �����
SELECT i.id,
       i.title,
       i.auth_id,
       a.name
FROM info I 
INNER JOIN auth A
ON I.auth_id = a.auth_id;

-- WHERE
SELECT *
FROM info I 
INNER JOIN auth A
ON i.auth_id = a.auth_id
WHERE id IN(1,2,3)
ORDER BY id DESC;

-- INNER JOIN USING
SELECT * 
FROM info
INNER JOIN auth
USING (auth_id);

----- OUTER JOIN -----

-- LEFT OUTER JOIN
SELECT *
FROM info I
LEFT OUTER JOIN auth A
ON i.auth_id = a.auth_id;
 
 -- RIGHT OUTER JOIN
 SELECT *
FROM info I
RIGHT OUTER JOIN auth A
ON i.auth_id = a.auth_id;
-- LEFT JOIN ����ص� ������ �ٲٸ� �� ������ ����
SELECT *
FROM auth A
LEFT OUTER JOIN info I
ON a.auth_id = i.auth_id;

-- FULL OUTER JOIN
SELECT * 
FROM info I
FULL OUTER JOIN auth A
ON i.auth_id = a.auth_id;

-- CROSS JOIN : �߸� �� ������ ����
SELECT *
FROM info I
CROSS JOIN auth A;
----------------------------------------------------------
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM LOCATIONS;

SELECT *
FROM employees E
JOIN departments D
ON e.department_id = d.department_id;

SELECT *
FROM employees E
LEFT JOIN departments D
ON e.department_id = d.department_id;

-- ������ ������ �� �� �ִ�.
SELECT *
FROM employees E 
LEFT JOIN departments D ON e.department_id = d.department_id
LEFT JOIN locations L ON d.location_id = l.location_id; 

-- SELF JOIN
SELECT * 
FROM employees e1
LEFT JOIN employees e2
ON e1.employee_id = e2.manager_id;

-- ����ϰ�
SELECT e1.*,
       e2.first_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id;

----------------------------------------------------------------------
-- ����Ŭ ���� ����
-- FROM�� �Ʒ��� ���̺��� ����, WHERE�� JOIN�� ������ ����

-- INNER JOIN
SELECT * 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- LEFT JOIN
SELECT * 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+); -- ���� ���̺� (+)

-- RIGHT JOIN
SELECT * 
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id; -- ���� ���̺� (+)

-- FULL JOIN�� ����
-- ������ �ִٸ� AND�� �����ؼ� ���
 