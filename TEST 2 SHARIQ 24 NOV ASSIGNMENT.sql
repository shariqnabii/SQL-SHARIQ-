DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;

SET autocommit = 1;

-- 2. Create table with proper constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

-- 3. Insert sample records
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
    
    -- answer 1 question 
    
    INSERT INTO employees 
    (employee_id, employee_name,department,city,salary,employment_status,phone)
    VALUES
    (11, 'karan malhotra', 'IT', 'noida',41000.00, 'active','9000000011');
    
    SELECT* FROM EMPLOYEES
    WHERE EMPLOYEE_ID =11;
    
    -- ANSWER 2 
    
    INSERT INTO employees 
    (employee_id, employee_name,department,city,salary,employment_status,phone)
    VALUES
    (12, 'SIMRAN KAUR', 'HR', 'DELHI',35000.00, 'ACTIVE', '9000000012'),
    (13, 'ROHAN DAS', 'SALES', 'PUNE',33000.00,'INACTIVE','9000000013');
    
    SELECT * FROM employees
WHERE employee_id IN (12, 13);

-- ANSWER 3

    update employees
    set city = 'gurgaon',
    salary = 46000.00
    where employee_id =11;
    
-- 4 answer 

    update employees
    set salary = salary * 1.10
    where employee_id in (1,4,7);
    
-- CHECK UPDATE SALARIES

    select employee_id, employee_name,salary
    from employees
    where employee_id in (1,4,7);
    
-- 5 ANSWER

   DELETE FROM EMPLOYEES
   WHERE EMPLOYEE_ID IN (3,8,13);
   
   -- CHECK DELETE RECORD
   
   SELECT * FROM EMPLOYEES
   WHERE EMPLOYEE_ID IN (3,8,13);
   
   # ANSWER 6 
   
     ALTER TABLE EMPLOYEES
     ADD COLUMN EMAIL VARCHAR (100) NULL;
     
     DESCRIBE EMPLOYEES;
     
# ANSWER 7 
    
     ALTER TABLE EMPLOYEES
     MODIFY COLUMN PHONE  VARCHAR(20) NULL;
     
     DESCRIBE EMPLOYEES;
     
# ANSWER 8

     ALTER TABLE EMPLOYEES
     CHANGE COLUMN CITY WORK_CITY VARCHAR(40);
     
# ANSWER 9

      ALTER TABLE EMPLOYEES
      DROP COLUMN EMAIL;
      
# ANSWER 10

      RENAME TABLE  EMPLOYEES TO STAFF;
      
      SELECT * FROM STAFF;
      
# ANSWER 11

      START TRANSACTION;
      
      INSERT  INTO STAFF
      (EMPLOYEE_ID,EMPLOYEE_NAME,DEPARTMENT,WORK_CITY,SALARY,EMPLOYMENT_STATUS,PHONE)
      VALUES
      (14,'NISHA RAO','IT','NOIDA', 44000.00,'ACTIVE','9000000014');
      
# ANSWER 12

       START TRANSACTION;

UPDATE staff
SET salary = 60000.00
WHERE employee_id = 5;

DELETE FROM staff
WHERE employee_id = 6;

ROLLBACK;

-- ANSWER 13 

     START TRANSACTION;

UPDATE staff
SET salary = 47000.00
WHERE employee_id = 14;

SAVEPOINT salary_saved;

--

UPDATE staff
SET work_city = 'Jaipur'
WHERE employee_id = 14;

SAVEPOINT city_saved;

-- 

DELETE FROM staff
WHERE employee_id = 14;

ROLLBACK TO SAVEPOINT city_saved;

ROLLBACK TO SAVEPOINT salary_saved;




     
     
   
   


    
    
    