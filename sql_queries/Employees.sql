CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Designation VARCHAR(50),
    Salary DECIMAL(18,2),
    BranchID INT,
    HireDate DATE,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);


 use [BankingAnalyticsDatabase]


DECLARE @EmployeeCounter INT = 1;

WHILE @EmployeeCounter <= 500
BEGIN
    INSERT INTO Employees
    (
        EmployeeName,
        Designation,
        Salary,
        BranchID,
        HireDate
    )
    VALUES
    (
        CONCAT('Employee ',@EmployeeCounter),
        CASE
            WHEN @EmployeeCounter % 5 = 0 THEN 'Manager'
            WHEN @EmployeeCounter % 3 = 0 THEN 'Officer'
            ELSE 'Cashier'
        END,
        ABS(CHECKSUM(NEWID())) % 90000 + 25000,
        ((@EmployeeCounter % 10)+1),
        DATEADD(DAY,-@EmployeeCounter,GETDATE())
    );

    SET @EmployeeCounter = @EmployeeCounter + 1;
END;


select * from Employees

