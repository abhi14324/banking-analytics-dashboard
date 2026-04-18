CREATE TABLE Transactions (
    TransactionID BIGINT PRIMARY KEY IDENTITY(1,1),
    AccountID INT,
    TransactionDate DATETIME,
    TransactionType VARCHAR(20),
    Amount DECIMAL(18,2),
    Channel VARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);



DECLARE @TransactionCounter BIGINT = 1;

WHILE @TransactionCounter <= 100000
BEGIN
    INSERT INTO Transactions
    (
        AccountID,
        TransactionDate,
        TransactionType,
        Amount,
        Channel
    )
    VALUES
    (
        ((@TransactionCounter % 30000)+1001),
        DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%365,GETDATE()),
        CASE
            WHEN @TransactionCounter % 2 = 0 THEN 'Credit'
            ELSE 'Debit'
        END,
        ABS(CHECKSUM(NEWID())) % 150000,
        CASE
            WHEN @TransactionCounter % 4 = 0 THEN 'ATM'
            WHEN @TransactionCounter % 3 = 0 THEN 'Online'
            ELSE 'Branch'
        END
    );

    SET @TransactionCounter = @TransactionCounter + 1;
END;


select * from Transactions