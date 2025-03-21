CREATE TABLE REGIONS (
                         region_id NUMBER PRIMARY KEY,
                         region_name VARCHAR2(50) NOT NULL
);

CREATE TABLE COUNTRIES (
                           country_id CHAR(2) PRIMARY KEY,
                           country_name VARCHAR2(50) NOT NULL,
                           region_id NUMBER REFERENCES REGIONS(region_id)
);

CREATE TABLE LOCATIONS (
                           location_id NUMBER PRIMARY KEY,
                           street_address VARCHAR2(100),
                           postal_code VARCHAR2(20),
                           city VARCHAR2(50) NOT NULL,
                           state_province VARCHAR2(50),
                           country_id CHAR(2) REFERENCES COUNTRIES(country_id)
);

CREATE TABLE DEPARTMENTS (
                             department_id NUMBER PRIMARY KEY,
                             department_name VARCHAR2(50) NOT NULL,
                             location_id NUMBER REFERENCES LOCATIONS(location_id)
);

CREATE TABLE JOBS (
                      job_id NUMBER PRIMARY KEY,
                      job_title VARCHAR2(50) NOT NULL,
                      min_salary NUMBER,
                      max_salary NUMBER
);

CREATE TABLE EMPLOYEES (
                           employee_id NUMBER PRIMARY KEY,
                           first_name VARCHAR2(50),
                           last_name VARCHAR2(50) NOT NULL,
                           email VARCHAR2(100) UNIQUE NOT NULL,
                           phone_number VARCHAR2(20),
                           hire_date DATE NOT NULL,
                           job_id NUMBER REFERENCES JOBS(job_id),
                           salary NUMBER NOT NULL,
                           manager_id NUMBER REFERENCES EMPLOYEES(employee_id),
                           department_id NUMBER REFERENCES DEPARTMENTS(department_id)
);

CREATE TABLE JOB_HISTORY (
                             employee_id NUMBER REFERENCES EMPLOYEES(employee_id),
                             start_date DATE NOT NULL,
                             end_date DATE NOT NULL,
                             job_id NUMBER REFERENCES JOBS(job_id),
                             department_id NUMBER REFERENCES DEPARTMENTS(department_id),
                             PRIMARY KEY (employee_id, start_date)
);
