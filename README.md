# Banking Analytics Dashboard

A multi-page banking analytics dashboard developed using Power BI and SQL Server to analyze transaction behavior, account performance, customer balance patterns, and financial activity.

This project focuses on monitoring banking operations through KPI reporting, transaction trends, and customer-level financial analysis.

The dataset was prepared in SQL Server and connected directly to Power BI for reporting.

---

## Project Objective

The objective of this project is to analyze banking transaction data and generate operational insights through interactive dashboard reporting.

The dashboard helps answer:

* What is the total balance across accounts?
* How many transactions have been recorded?
* What is the average transaction amount?
* Which account types hold higher balances?
* Which months show higher transaction activity?
* How customer balances vary across records?

---

## Tools Used

* Power BI
* SQL Server
* DAX Measures
* Power BI Service

---

## Data Source

The banking dataset used in this project was prepared inside SQL Server and connected directly to Power BI for dashboard development.

The source contains:

* customer names
* account type
* transaction amount
* balance
* transaction type
* age group
* gender
* monthly transaction records

---

## Dashboard Structure

This project contains **2 analytical pages**.

---

# Page 1: Banking Transaction Overview

This page focuses on executive-level banking transaction reporting.

## KPI Cards Included

* Unique Customers
* Total Transactions
* Total Balance
* Avg Transaction Amount

## Visuals Included

### Inactive Accounts by Month

Monthly inactive account pattern.

### Net Balance by Account Type

Comparison between:

* Savings
* Current

### Top Customers by Transaction Amount

Customer-wise contribution.

### Monthly Transaction Amount

Month-level banking movement.

### Transaction Type Distribution

Compares:

* Credit
* Debit

---

# Page 2: Customer Account & Balance Analysis

This page focuses on customer segmentation and balance distribution.

## Visuals Included

### Monthly Transaction Balance

Balance movement by month.

### Top Customers by Amount

Customer transaction comparison.

### Account Type Distribution

Savings vs Current account composition.

### Customer Age Group Distribution

Age-based segmentation.

### Gender Distribution

Customer demographic comparison.

---

## DAX Measures Used

### Unique Customers

```DAX id="dgwzhq"
Unique Customers = DISTINCTCOUNT(Banking[Name])
```

### Total Transactions

```DAX id="xmd8yx"
Total Transactions = COUNTROWS(Banking)
```

### Total Balance

```DAX id="7dxw62"
Total Balance = SUM(Banking[Balance])
```

### Avg Transaction Amount

```DAX id="tgu4hz"
Avg Transaction Amount = AVERAGE(Banking[Amount])
```

---

## SQL Work Included

SQL Server was used to prepare and structure the dataset before dashboard creation.

### Example Queries

```sql id="8hk2ry"
SELECT COUNT(*) AS TotalTransactions FROM Banking;
```

```sql id="ptui51"
SELECT SUM(Balance) AS TotalBalance FROM Banking;
```

```sql id="x0kzsz"
SELECT AVG(Amount) AS AvgTransactionAmount FROM Banking;
```

```sql id="e73exg"
SELECT AccountType, SUM(Balance)
FROM Banking
GROUP BY AccountType;
```

---

## Key Business Insights

* Savings accounts contribute higher balance volume
* Monthly transactions peak during selected months
* Credit and debit transactions remain balanced
* Limited customers dominate transaction volume

---

## Power BI Service

The dashboard can also be published to Power BI Service for cloud-based reporting.

Live Dashboard Power BI Service Link : https://app.powerbi.com/groups/90e27ec9-c909-41ee-9573-264db82d6787/reports/fc7b3785-3e61-4b7c-827a-db1d663a0443/b10bf1b20005c94ee55a?experience=power-bi

---

---

## Screenshots
![banking-analytics-dashboard-powerbi](screenshots)


--

## Repository Structure

```text id="vlgw6l"
banking-analytics-dashboard-powerbi/
│
├── sql_queries/
│   └── banking_queries.sql
│
├── dax_measures/
│   └── measures.txt
│
├── screenshots/
│   ├── banking_overview.png
│   └── customer_analysis.png
│
├── documentation/
│   └── Banking_Project_Documentation.docx
│
├── Banking_Analytics_Dashboard.pbix
│
└── README.md
```

---

## Future Improvements

* Add branch-level analysis
* Add loan-to-deposit ratio
* Add customer churn indicators
* Add advanced SQL procedures

---

## Author

Abhi
