-- Create Blinkit database
CREATE DATABASE blinkitdb;
USE blinkitdb;

-- Create main table
CREATE TABLE blinkit_data (
    Item_Identifier VARCHAR(20),
    Item_Weight FLOAT,
    Item_Fat_Content VARCHAR(50),
    Item_Visibility FLOAT,
    Item_Type VARCHAR(50),
    Item_MRP FLOAT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Establishment_Year INT,
    Outlet_Size VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Type VARCHAR(50),
    Total_Sales FLOAT,
    Rating INT
);

-- Load data 
LOAD DATA LOCAL INFILE '/Users/ramalakshmi/Downloads/blinkit_data_clean.csv'
INTO TABLE blinkit_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Clean Item_Fat_Content column
UPDATE blinkit_data
SET Item_Fat_Content = CASE
    WHEN Item_Fat_Content IN ('LF', 'lowfat') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;

-- Check total rows
SELECT COUNT(*) AS Total_Rows FROM blinkit_data;
