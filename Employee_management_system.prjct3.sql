CREATE TABLE DEPARTMENTS(
	DEPARTMENT_ID	SERIAL	PRIMARY KEY,
	DEPARTMENT_NAME			VARCHAR(100)  NOT NULL,
	MANAGER_ID				INT,
	CREATEDAT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE EMPLOYEES (
	EMPLOYEE_ID		SERIAL	PRIMARY KEY,
	FIRST_NAME		VARCHAR(50),
	LAST_NAME		VARCHAR(50),
	GENDER			CHAR(1),
	DOB				DATE,
	HIRE_DATE		DATE	DEFAULT	CURRENT_DATE,
	DEPARTMENT_ID	INT	REFERENCES DEPARTMENTS(DEPARTMENT_ID),
	JOB_TITLE		VARCHAR(100),
	EMAIL			VARCHAR(100)	UNIQUE NOT NULL,
	PHONE_NUMBER	VARCHAR(15),
	ADDRESS			TEXT,
	CREATEDAT	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE ATTENDANCE (
	ATTENDANCE_ID		SERIAL PRIMARY KEY,
	EMPLOYEE_ID 		INT	REFERENCES	EMPLOYEES(EMPLOYEE_ID),
	DATE	DATE		NOT NULL,
	STATUS 		VARCHAR(10)	CHECK(STATUS IN ('PRESENT', 'ABSENT', 'LEAVE')),
	CHECK_IN_TIME		TIME,
	CHECK_OUT_TIME		TIME
);


CREATE TABLE PERFORMANCE(
	PERFORMANCE_ID		SERIAL		PRIMARY KEY,
	EMPLOYEE_ID			INT	 REFERENCES		EMPLOYEES(EMPLOYEE_ID),
	REVIEW_DATE			DATE	NOT NULL,
	RATING				INT		CHECK	(RATING BETWEEN 1 AND 5),
	COMENTS				TEXT
);


CREATE TABLE Payroll (
    Payroll_ID SERIAL PRIMARY KEY,
    Employee_ID INT REFERENCES Employees(Employee_ID),
    Salary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2) DEFAULT 0,
    Deductions DECIMAL(10, 2) DEFAULT 0,
    NetPay DECIMAL(10, 2),
    Pay_Date DATE DEFAULT CURRENT_DATE
);


CREATE TABLE Leaves (
    Leave_ID SERIAL PRIMARY KEY,
    Employee_ID INT REFERENCES Employees(Employee_ID),
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Leave_Type VARCHAR(50),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Approved', 'Rejected')),
    Reason TEXT
);



INSERT INTO Departments (Department_Name, Manager_ID)
VALUES 
('HR', 1),
('IT', 2),
('Finance', 3),
('Marketing', 4),
('Sales', 5),
('R&D', 6),
('Operations', 7),
('Procurement', 8),
('Support', 9),
('Training', 10),
('Legal', 11),
('Admin', 12),
('Customer Service', 13),
('Public Relations', 14),
('Production', 15),
('Logistics', 16),
('Quality Assurance', 17),
('Compliance', 18),
('Risk Management', 19),
('Strategy', 20);




INSERT INTO Employees (First_Name, Last_Name, Gender, DOB, Department_ID, Job_Title, Email, Phone_Number, Address)
VALUES 
('John', 'Smith', 'M', '1990-01-01', 1, 'HR Manager', 'john.smith@example.com', '1111111111', '123 HR Street, City'),
('Alice', 'Johnson', 'F', '1992-02-02', 2, 'IT Specialist', 'alice.johnson@example.com', '2222222222', '456 IT Street, City'),
('Robert', 'Brown', 'M', '1988-03-03', 3, 'Finance Analyst', 'robert.brown@example.com', '3333333333', '789 Finance Ave, City'),
('Emily', 'Davis', 'F', '1993-04-04', 4, 'Marketing Coordinator', 'emily.davis@example.com', '4444444444', '101 Marketing Blvd, City'),
('Michael', 'Wilson', 'M', '1985-05-05', 5, 'Sales Executive', 'michael.wilson@example.com', '5555555555', '202 Sales Lane, City'),
('Sophia', 'Taylor', 'F', '1991-06-06', 6, 'R&D Scientist', 'sophia.taylor@example.com', '6666666666', '303 R&D Road, City'),
('James', 'Anderson', 'M', '1987-07-07', 7, 'Operations Manager', 'james.anderson@example.com', '7777777777', '404 Operations Way, City'),
('Olivia', 'Thomas', 'F', '1994-08-08', 8, 'Procurement Officer', 'olivia.thomas@example.com', '8888888888', '505 Procurement Dr, City'),
('William', 'Moore', 'M', '1990-09-09', 9, 'Support Specialist', 'william.moore@example.com', '9999999999', '606 Support St, City'),
('Ava', 'Martin', 'F', '1989-10-10', 10, 'Training Officer', 'ava.martin@example.com', '1010101010', '707 Training Circle, City'),
('Liam', 'Jackson', 'M', '1986-11-11', 11, 'Legal Advisor', 'liam.jackson@example.com', '1111111112', '808 Legal Plaza, City'),
('Charlotte', 'White', 'F', '1995-12-12', 12, 'Admin Assistant', 'charlotte.white@example.com', '1212121212', '909 Admin Court, City'),
('Noah', 'Harris', 'M', '1984-01-13', 13, 'Customer Service Rep', 'noah.harris@example.com', '1313131313', '101 Customer Rd, City'),
('Isabella', 'Clark', 'F', '1996-02-14', 14, 'PR Specialist', 'isabella.clark@example.com', '1414141414', '202 PR Lane, City'),
('Benjamin', 'Lewis', 'M', '1983-03-15', 15, 'Production Supervisor', 'benjamin.lewis@example.com', '1515151515', '303 Production Blvd, City'),
('Amelia', 'Walker', 'F', '1997-04-16', 16, 'Logistics Coordinator', 'amelia.walker@example.com', '1616161616', '404 Logistics Ave, City'),
('Elijah', 'Hall', 'M', '1991-05-17', 17, 'Quality Assurance Analyst', 'elijah.hall@example.com', '1717171717', '505 QA Way, City'),
('Mia', 'Young', 'F', '1992-06-18', 18, 'Compliance Officer', 'mia.young@example.com', '1818181818', '606 Compliance Dr, City'),
('Lucas', 'Allen', 'M', '1982-07-19', 19, 'Risk Manager', 'lucas.allen@example.com', '1919191919', '707 Risk St, City'),
('Harper', 'King', 'F', '1993-08-20', 20, 'Strategy Consultant', 'harper.king@example.com', '2020202020', '808 Strategy Plaza, City');



INSERT INTO ATTENDANCE (EMPLOYEE_ID, DATE, STATUS, CHECK_IN_TIME, CHECK_OUT_TIME)
VALUES
(1, '2024-11-01', 'PRESENT', '09:00:00', '17:00:00'),
(2, '2024-11-01', 'PRESENT', '09:15:00', '17:15:00'),
(3, '2024-11-01', 'ABSENT', NULL, NULL),
(4, '2024-11-01', 'LEAVE', NULL, NULL),
(5, '2024-11-01', 'PRESENT', '08:45:00', '16:45:00'),
(6, '2024-11-01', 'PRESENT', '09:30:00', '17:30:00'),
(7, '2024-11-01', 'PRESENT', '09:10:00', '17:10:00'),
(8, '2024-11-01', 'ABSENT', NULL, NULL),
(9, '2024-11-01', 'PRESENT', '08:50:00', '16:50:00'),
(10, '2024-11-01', 'LEAVE', NULL, NULL),
(11, '2024-11-01', 'PRESENT', '09:05:00', '17:05:00'),
(12, '2024-11-01', 'PRESENT', '09:20:00', '17:20:00'),
(13, '2024-11-01', 'ABSENT', NULL, NULL),
(14, '2024-11-01', 'PRESENT', '09:25:00', '17:25:00'),
(15, '2024-11-01', 'PRESENT', '08:55:00', '16:55:00'),
(16, '2024-11-01', 'LEAVE', NULL, NULL),
(17, '2024-11-01', 'PRESENT', '09:00:00', '17:00:00'),
(18, '2024-11-01', 'PRESENT', '09:15:00', '17:15:00'),
(19, '2024-11-01', 'ABSENT', NULL, NULL),
(20, '2024-11-01', 'PRESENT', '09:10:00', '17:10:00');



INSERT INTO PERFORMANCE (EMPLOYEE_ID, REVIEW_DATE, RATING, COMENTS)
VALUES
(1, '2024-01-15', 5, 'Excellent performance in HR management.'),
(2, '2024-02-10', 4, 'Strong technical skills and problem-solving.'),
(3, '2024-03-12', 3, 'Meets expectations, but needs improvement in punctuality.'),
(4, '2024-04-08', 5, 'Outstanding marketing initiatives.'),
(5, '2024-05-20', 2, 'Below expectations, needs to improve sales targets.'),
(6, '2024-06-05', 4, 'Good R&D contributions, very creative.'),
(7, '2024-07-14', 3, 'Satisfactory work, but could manage operations better.'),
(8, '2024-08-22', 4, 'Excellent procurement planning.'),
(9, '2024-09-10', 5, 'Outstanding support to clients.'),
(10, '2024-10-01', 3, 'Decent training programs, needs more engagement.'),
(11, '2024-11-05', 4, 'Provided valuable legal advice.'),
(12, '2024-12-18', 5, 'Very efficient admin tasks handling.'),
(13, '2024-01-02', 4, 'Good customer interaction and resolution skills.'),
(14, '2024-01-15', 5, 'Excellent PR campaigns.'),
(15, '2024-02-10', 3, 'Meets expectations in production management.'),
(16, '2024-03-12', 2, 'Needs better coordination in logistics.'),
(17, '2024-04-08', 5, 'Highly accurate QA processes.'),
(18, '2024-05-20', 4, 'Compliance maintained effectively.'),
(19, '2024-06-05', 3, 'Risk management strategies are average.'),
(20, '2024-07-14', 5, 'Exceptional strategic planning.');



INSERT INTO Payroll (Employee_ID, Salary, Bonus, Deductions, NetPay, Pay_Date)
VALUES
(1, 50000.00, 5000.00, 2000.00, 53000.00, '2024-11-25'),
(2, 60000.00, 6000.00, 2500.00, 63500.00, '2024-11-25'),
(3, 55000.00, 4000.00, 1500.00, 57500.00, '2024-11-25'),
(4, 65000.00, 7000.00, 3000.00, 69000.00, '2024-11-25'),
(5, 50000.00, 3000.00, 1000.00, 52000.00, '2024-11-25'),
(6, 70000.00, 8000.00, 3500.00, 74500.00, '2024-11-25'),
(7, 55000.00, 5000.00, 2000.00, 58000.00, '2024-11-25'),
(8, 60000.00, 6000.00, 2500.00, 63500.00, '2024-11-25'),
(9, 50000.00, 3000.00, 1000.00, 52000.00, '2024-11-25'),
(10, 45000.00, 2000.00, 500.00, 46500.00, '2024-11-25'),
(11, 70000.00, 8000.00, 3500.00, 74500.00, '2024-11-25'),
(12, 50000.00, 5000.00, 2000.00, 53000.00, '2024-11-25'),
(13, 60000.00, 6000.00, 2500.00, 63500.00, '2024-11-25'),
(14, 55000.00, 4000.00, 1500.00, 57500.00, '2024-11-25'),
(15, 65000.00, 7000.00, 3000.00, 69000.00, '2024-11-25'),
(16, 50000.00, 3000.00, 1000.00, 52000.00, '2024-11-25'),
(17, 70000.00, 8000.00, 3500.00, 74500.00, '2024-11-25'),
(18, 60000.00, 6000.00, 2500.00, 63500.00, '2024-11-25'),
(19, 50000.00, 3000.00, 1000.00, 52000.00, '2024-11-25'),
(20, 45000.00, 2000.00, 500.00, 46500.00, '2024-11-25');



INSERT INTO Leaves (Employee_ID, Start_Date, End_Date, Leave_Type, Status, Reason)
VALUES
(1, '2024-12-01', '2024-12-05', 'Sick Leave', 'Approved', 'Flu and fever'),
(2, '2024-12-10', '2024-12-15', 'Casual Leave', 'Pending', 'Family function'),
(3, '2024-12-20', '2024-12-22', 'Sick Leave', 'Approved', 'Medical checkup'),
(4, '2024-11-30', '2024-12-02', 'Emergency Leave', 'Rejected', 'Urgent personal work'),
(5, '2024-12-05', '2024-12-10', 'Maternity Leave', 'Approved', 'Childbirth preparation'),
(6, '2024-12-15', '2024-12-18', 'Sick Leave', 'Approved', 'Back pain treatment'),
(7, '2024-12-25', '2024-12-30', 'Vacation', 'Pending', 'Holiday trip'),
(8, '2024-12-01', '2024-12-03', 'Casual Leave', 'Approved', 'Moving to a new house'),
(9, '2024-12-04', '2024-12-06', 'Emergency Leave', 'Approved', 'Accident recovery'),
(10, '2024-12-07', '2024-12-08', 'Casual Leave', 'Rejected', 'Not specified'),
(11, '2024-12-09', '2024-12-11', 'Sick Leave', 'Approved', 'Common cold'),
(12, '2024-12-12', '2024-12-14', 'Vacation', 'Pending', 'Christmas holidays'),
(13, '2024-12-15', '2024-12-18', 'Casual Leave', 'Rejected', 'Unclear reason'),
(14, '2024-12-19', '2024-12-21', 'Emergency Leave', 'Approved', 'Family illness'),
(15, '2024-12-22', '2024-12-24', 'Sick Leave', 'Approved', 'Flu symptoms'),
(16, '2024-12-26', '2024-12-30', 'Vacation', 'Pending', 'Travel to hometown'),
(17, '2024-12-01', '2024-12-03', 'Casual Leave', 'Approved', 'Wedding in family'),
(18, '2024-12-04', '2024-12-06', 'Emergency Leave', 'Rejected', 'No sufficient details'),
(19, '2024-12-07', '2024-12-10', 'Sick Leave', 'Approved', 'Fever and weakness'),
(20, '2024-12-11', '2024-12-13', 'Vacation', 'Approved', 'Anniversary celebration');



SELECT First_Name, Last_Name, Job_Title FROM Employees WHERE Department_ID = 1;

SELECT * FROM Attendance WHERE Employee_ID = 1 AND Date BETWEEN '2024-11-01' AND '2024-11-01';


CREATE OR REPLACE FUNCTION Calculate_Net_Pay(salary DECIMAL, bonus DECIMAL, deductions DECIMAL)
RETURNS DECIMAL AS $$
BEGIN
    RETURN salary + bonus - deductions;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION UpdateNetPay()
RETURNS TRIGGER AS $$
BEGIN
    NEW.NetPay := CalculateNetPay(NEW.Salary, NEW.Bonus, NEW.Deductions);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TriggerUpdateNetPay
BEFORE INSERT OR UPDATE ON Payroll
FOR EACH ROW
EXECUTE PROCEDURE UpdateNetPay();



SELECT e.First_Name, e.Last_Name, p.NetPay, p.Pay_Date
FROM Employees e
JOIN Payroll p ON e.Employee_ID = p.Employee_ID;



SELECT e.First_Name, e.Last_Name, l.Start_Date, l.End_Date, l.Leave_Type
FROM Employees e
JOIN Leaves l ON e.Employee_ID = l.Employee_ID
WHERE l.Status = 'Approved';










