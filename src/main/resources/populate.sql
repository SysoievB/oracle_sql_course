-- Insert data into REGIONS
INSERT INTO REGIONS (region_id, region_name)
VALUES (1, 'North America');
INSERT INTO REGIONS (region_id, region_name)
VALUES (2, 'Europe');
INSERT INTO REGIONS (region_id, region_name)
VALUES (3, 'Asia');
INSERT INTO REGIONS (region_id, region_name)
VALUES (4, 'South America');
INSERT INTO REGIONS (region_id, region_name)
VALUES (5, 'Africa');
INSERT INTO REGIONS (region_id, region_name)
VALUES (6, 'Australia');
INSERT INTO REGIONS (region_id, region_name)
VALUES (7, 'Middle East');
INSERT INTO REGIONS (region_id, region_name)
VALUES (8, 'Antarctica');
INSERT INTO REGIONS (region_id, region_name)
VALUES (9, 'Central America');
INSERT INTO REGIONS (region_id, region_name)
VALUES (10, 'Caribbean');
INSERT INTO REGIONS (region_id, region_name)
VALUES (11, 'Arctic');
INSERT INTO REGIONS (region_id, region_name)
VALUES (12, 'Indian Ocean');
INSERT INTO REGIONS (region_id, region_name)
VALUES (13, 'Pacific');
INSERT INTO REGIONS (region_id, region_name)
VALUES (14, 'Atlantic');
INSERT INTO REGIONS (region_id, region_name)
VALUES (15, 'Mediterranean');
INSERT INTO REGIONS (region_id, region_name)
VALUES (16, 'Arctic Circle');
INSERT INTO REGIONS (region_id, region_name)
VALUES (17, 'South Asia');
INSERT INTO REGIONS (region_id, region_name)
VALUES (18, 'Eastern Europe');
INSERT INTO REGIONS (region_id, region_name)
VALUES (19, 'Western Europe');
INSERT INTO REGIONS (region_id, region_name)
VALUES (20, 'Southern Africa');

-- Insert data into COUNTRIES
INSERT ALL
    INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('US', 'United States', 1)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('CA', 'Canada', 1)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('FR', 'France', 2)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('DE', 'Germany', 2)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('CN', 'China', 3)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('JP', 'Japan', 3)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('BR', 'Brazil', 4)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('AR', 'Argentina', 4)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('ZA', 'South Africa', 5)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('EG', 'Egypt', 5)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('AU', 'Australia', 6)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('NZ', 'New Zealand', 6)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('SA', 'Saudi Arabia', 7)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('AE', 'United Arab Emirates', 7)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('MX', 'Mexico', 9)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('CU', 'Cuba', 10)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('RU', 'Russia', 18)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('IN', 'India', 17)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('IT', 'Italy', 19)
INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('ES', 'Spain', 19)
SELECT *
FROM dual;

-- Insert data into LOCATIONS
INSERT ALL
    INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1, '123 Main St', '10001', 'New York', 'NY', 'US')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (2, '456 Queen St', 'M5V 2B6', 'Toronto', 'ON', 'CA')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (3, '789 Champs Elysees', '75008', 'Paris', NULL, 'FR')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (4, '101 Berlin Rd', '10115', 'Berlin', NULL, 'DE')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (5, '202 Beijing St', '100000', 'Beijing', NULL, 'CN')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (6, '303 Tokyo Ave', '100-0001', 'Tokyo', NULL, 'JP')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (7, '404 Rio Blvd', '20040', 'Rio de Janeiro', NULL, 'BR')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (8, '505 Buenos Aires St', 'C1001', 'Buenos Aires', NULL, 'AR')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (9, '606 Cape Town Ln', '8001', 'Cape Town', NULL, 'ZA')
INTO LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (10, '707 Sydney St', '2000', 'Sydney', NULL, 'AU')
SELECT *
FROM dual;


-- Insert data into DEPARTMENTS
INSERT ALL
    INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (1, 'HR', 1)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (2, 'Finance', 2)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (3, 'Engineering', 3)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (4, 'Marketing', 4)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (5, 'Sales', 5)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (6, 'Support', 6)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (7, 'IT', 7)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (8, 'Legal', 8)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (9, 'Procurement', 9)
INTO DEPARTMENTS (department_id, department_name, location_id)
VALUES (10, 'Logistics', 10)
SELECT *
FROM dual;


-- Insert data into JOBS
INSERT ALL
    INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (1, 'Software Engineer', 60000, 120000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (2, 'HR Manager', 50000, 100000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (3, 'Financial Analyst', 55000, 110000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (4, 'Marketing Specialist', 45000, 90000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (5, 'Sales Representative', 40000, 85000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (6, 'Support Engineer', 42000, 88000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (7, 'IT Administrator', 50000, 95000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (8, 'Legal Advisor', 70000, 140000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (9, 'Procurement Officer', 48000, 96000)
INTO JOBS (job_id, job_title, min_salary, max_salary)
VALUES (10, 'Logistics Coordinator', 46000, 93000)
SELECT *
FROM dual;


-- Insert data into EMPLOYEES
INSERT ALL
    INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (1, 'John', 'Doe', 'jdoe@example.com', TO_DATE('2015-06-01', 'YYYY-MM-DD'), 1, 90000, 3)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (2, 'Jane', 'Smith', 'jsmith@example.com', TO_DATE('2017-08-15', 'YYYY-MM-DD'), 2, 75000, 1)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (3, 'Bob', 'Brown', 'bbrown@example.com', TO_DATE('2018-09-23', 'YYYY-MM-DD'), 3, 80000, 2)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (4, 'Alice%', 'Jones', 'ajones@example.com', TO_DATE('2019-12-10', 'YYYY-MM-DD'), 4, 70000, 4)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (5, 'Charlie', 'Wilson', 'cwilson@example.com', TO_DATE('2016-05-18', 'YYYY-MM-DD'), 5, 65000, 5)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (6, 'David', 'Jones', 'djones@example.com', TO_DATE('2019-12-10', 'YYYY-MM-DD'), 2, 50000, 3)
INTO EMPLOYEES (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id) VALUES (7, 'David', 'Jones', 'davjones@example.com', TO_DATE('2019-11-10', 'YYYY-MM-DD'), 4, 80000, 1)
SELECT *
FROM dual;


-- Insert data into JOB_HISTORY
INSERT ALL
    INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
VALUES (1, TO_DATE('2014-01-01', 'YYYY-MM-DD'), TO_DATE('2015-05-31', 'YYYY-MM-DD'), 5, 5)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
VALUES (2, TO_DATE('2016-01-01', 'YYYY-MM-DD'), TO_DATE('2017-08-14', 'YYYY-MM-DD'), 3, 2)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
VALUES (3, TO_DATE('2017-02-01', 'YYYY-MM-DD'), TO_DATE('2018-09-22', 'YYYY-MM-DD'), 4, 4)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
VALUES (4, TO_DATE('2018-06-15', 'YYYY-MM-DD'), TO_DATE('2019-12-09', 'YYYY-MM-DD'), 2, 1)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id) VALUES (5, TO_DATE('2015-03-10', 'YYYY-MM-DD'), TO_DATE('2016-05-17', 'YYYY-MM-DD'), 1, 3)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id) VALUES (6, TO_DATE('2015-03-10', 'YYYY-MM-DD'), TO_DATE('2016-05-17', 'YYYY-MM-DD'), 2, 3)
INTO JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id) VALUES (7, TO_DATE('2015-03-10', 'YYYY-MM-DD'), TO_DATE('2016-05-17', 'YYYY-MM-DD'), 4, 1)
SELECT *
FROM dual;
