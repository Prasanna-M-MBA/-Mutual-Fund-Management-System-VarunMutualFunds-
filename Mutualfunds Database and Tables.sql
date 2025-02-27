Create database Varunmutualfunds;
use Varunmutualfunds;


Create table customers(
Customer_id int auto_increment primary key,
name varchar(100) not null,
email varchar(100) unique not null,
phone varchar(100),
address text(500),
date_of_birth date,
date_of_registration timestamp default current_timestamp
);

CREATE TABLE Funds (
    fund_id INT AUTO_INCREMENT PRIMARY KEY,
    fund_name VARCHAR(255) NOT NULL,
    fund_type VARCHAR(50) NOT NULL,  -- Equity, Debt, Hybrid, etc.
    fund_manager VARCHAR(255),
    expense_ratio DECIMAL(5, 2),
    inception_date DATE,
    current_nav DECIMAL(10, 2),  -- Net Asset Value (NAV)
    status VARCHAR(20) DEFAULT 'Active'  -- Active, Inactive, etc.
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT,
    fund_id INT,
    transaction_type VARCHAR(50),  -- 'Purchase' or 'Redemption'
    amount DECIMAL(10, 2),
    units DECIMAL(10, 2),  -- Number of units purchased or redeemed
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (fund_id) REFERENCES Funds(fund_id)
);

CREATE TABLE SIP (
    sip_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT,
    fund_id INT,
    sip_amount DECIMAL(10, 2),
    sip_frequency VARCHAR(50),  -- Monthly, Quarterly, etc.
    start_date DATE,
    end_date DATE,
    status VARCHAR(20) DEFAULT 'Active',  -- Active, Completed, Canceled
    FOREIGN KEY (customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (fund_id) REFERENCES Funds(fund_id)
);

CREATE TABLE NAV_History (
    nav_id INT AUTO_INCREMENT PRIMARY KEY,
    fund_id INT,
    nav_value DECIMAL(10, 2),
    nav_date DATE,
    FOREIGN KEY (fund_id) REFERENCES Funds(fund_id)
);

CREATE TABLE Fund_Performance (
    performance_id INT AUTO_INCREMENT PRIMARY KEY,
    fund_id INT,
    performance_period VARCHAR(50),  -- 1 month, 1 year, etc.
    return_percentage DECIMAL(5, 2),  -- Percentage returns
    date_recorded DATE,
    FOREIGN KEY (fund_id) REFERENCES Funds(fund_id)
);

INSERT INTO Customers (name, email, phone, address, date_of_birth) 
VALUES ('John Doe', 'john.doe@example.com', '9876543210', '123 Street, City, State', '1985-07-15');

INSERT INTO Funds (fund_name, fund_type, fund_manager, expense_ratio, inception_date, current_nav) 
VALUES ('Varun Equity Fund', 'Equity', 'Mr. Varun Sharma', 1.25, '2015-04-10', 102.50);

INSERT INTO Transactions (customer_id, fund_id, transaction_type, amount, units) 
VALUES (1, 1, 'Purchase', 5000, 50);

INSERT INTO SIP (Customer_id, fund_id, sip_amount, sip_frequency, start_date, end_date) 
VALUES (1, 1, 2000, 'Monthly', '2023-01-01', '2025-01-01');

INSERT INTO NAV_History (fund_id, nav_value, nav_date) 
VALUES (1, 102.50, '2025-02-27');

INSERT INTO Fund_Performance (fund_id, performance_period, return_percentage, date_recorded) 
VALUES (1, '1 Year', 15.25, '2025-02-27');





