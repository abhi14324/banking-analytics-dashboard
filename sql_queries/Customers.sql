CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    BranchID INT,
    JoinDate DATE,
    CustomerSegment VARCHAR(20),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);



DECLARE @CustomerCounter INT = 1;

WHILE @CustomerCounter <= 20000
BEGIN
    INSERT INTO Customers
    (
        FullName,
        Gender,
        DOB,
        Phone,
        Email,
        City,
        BranchID,
        JoinDate,
        CustomerSegment
    )
    VALUES
    (
        CONCAT('Customer ', @CustomerCounter),
        CASE 
            WHEN @CustomerCounter % 2 = 0 THEN 'Male'
            ELSE 'Female'
        END,
        DATEADD(DAY,-(@CustomerCounter*20),GETDATE()),
        CONCAT('98',RIGHT('00000000'+CAST(@CustomerCounter AS VARCHAR),8)),
        CONCAT('customer',@CustomerCounter,'@bank.com'),
        CASE 
            WHEN @CustomerCounter % 3 = 0 THEN 'Lucknow'
            WHEN @CustomerCounter % 5 = 0 THEN 'Kanpur'
            ELSE 'Delhi'
        END,
        ((@CustomerCounter % 10)+1),
        DATEADD(DAY,-@CustomerCounter,GETDATE()),
        CASE
            WHEN @CustomerCounter % 10 = 0 THEN 'Premium'
            WHEN @CustomerCounter % 3 = 0 THEN 'Business'
            ELSE 'Regular'
        END
    );

    SET @CustomerCounter = @CustomerCounter + 1;
END;


select * from Customers