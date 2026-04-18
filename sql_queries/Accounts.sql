CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1001,1),
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(18,2),
    OpenDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

select * from Accounts


DECLARE @AccountCounter INT = 1;

WHILE @AccountCounter <= 30000
BEGIN
    INSERT INTO Accounts
    (
        CustomerID,
        AccountType,
        Balance,
        OpenDate,
        Status
    )
    VALUES
    (
        ((@AccountCounter % 20000)+1),
        CASE
            WHEN @AccountCounter % 2 = 0 THEN 'Savings'
            ELSE 'Current'
        END,
        ABS(CHECKSUM(NEWID())) % 800000,
        DATEADD(DAY,-@AccountCounter,GETDATE()),
        CASE
            WHEN @AccountCounter % 50 = 0 THEN 'Dormant'
            ELSE 'Active'
        END
    );

    SET @AccountCounter = @AccountCounter + 1;
END;