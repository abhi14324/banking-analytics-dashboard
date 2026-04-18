

CREATE DATABASE BankingAnalyticsDatabase;
GO

USE BankingAnalyticsDatabase;
GO


CREATE TABLE Branches (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    OpenYear INT
);

-- insert data 

INSERT INTO Branches (BranchName, City, State, OpenYear)
VALUES
('Hazratganj Branch','Lucknow','UP',2005),
('Gomti Nagar Branch','Lucknow','UP',2010),
('Kanpur Main','Kanpur','UP',2002),
('Delhi Central','Delhi','Delhi',2008),
('Mumbai West','Mumbai','Maharashtra',2001),
('Noida Sector 18','Noida','UP',2012),
('Agra Main','Agra','UP',2007),
('Varanasi Branch','Varanasi','UP',2006),
('Jaipur Central','Jaipur','Rajasthan',2003),
('Pune Branch','Pune','Maharashtra',2011);

select * from Branches