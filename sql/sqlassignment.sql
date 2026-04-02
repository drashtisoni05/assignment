create database MarketCo;

use MarketCo;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip)
VALUES
(1, 'Urban Outfitters', '123 Market St', 'Philadelphia', 'PA', '19103'),
(2, 'Toll Brothers', '250 Gibraltar Rd', 'Horsham', 'PA', '19044'),
(3, 'Comcast', '1701 JFK Blvd', 'Philadelphia', 'PA', '19103');

select * from company;

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 1, 'Dianne', 'Connor', '45 Walnut St', 'Philadelphia', 'PA', '19106', TRUE, 'dianne@urban.com', '215-555-1111'),
(2, 2, 'Mark', 'Smith', '67 Pine St', 'Horsham', 'PA', '19044', FALSE, 'mark@toll.com', '215-555-2222'),
(3, 3, 'Sara', 'Brown', '90 Chestnut St', 'Philadelphia', 'PA', '19103', TRUE, 'sara@comcast.com', '215-555-3333');

select * from contact;

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(1, 'Jack', 'Lee', 60000.00, '2021-05-10', 'Sales Manager', 'jack@marketco.com', '215-555-4444'),
(2, 'Lesley', 'Bland', 55000.00, '2022-03-15', 'Sales Executive', 'lesley@marketco.com', '215-555-5555'),
(3, 'John', 'King', 50000.00, '2020-09-20', 'Marketing Analyst', 'john@marketco.com', '215-555-6666');

select * from employee;

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, 1, '2024-01-10', 'Discussed partnership'),
(2, 2, 1, '2024-02-15', 'Sales meeting'),
(3, 1, 2, '2024-03-05', 'Follow up call'),
(4, 3, 3, '2024-03-20', 'Marketing discussion');

select * from contactemployee;

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley'
AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

select * from company;

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 1;

select * from ContactEmployee;

DELETE ce
FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Dianne'
AND c.LastName = 'Connor'
AND e.FirstName = 'Jack'
AND e.LastName = 'Lee';

SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';
