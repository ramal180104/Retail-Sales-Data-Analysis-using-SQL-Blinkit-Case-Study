USE blinkitdb;

--  KPI 1: Total Sales
SELECT SUM(Total_Sales) AS Total_Sales FROM blinkit_data;

--  KPI 2: Average Rating
SELECT ROUND(AVG(Rating),2) AS Avg_Rating FROM blinkit_data;

--  KPI 3: Average Item Weight
SELECT ROUND(AVG(Item_Weight),2) AS Avg_Item_Weight FROM blinkit_data;

--  KPI 4: Average MRP
SELECT ROUND(AVG(Item_MRP),2) AS Avg_Item_MRP FROM blinkit_data;

--  Top 5 Outlets by Total Sales
SELECT Outlet_Identifier, SUM(Total_Sales) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Identifier
ORDER BY Total_Sales DESC
LIMIT 5;

--  Sales by Item Type
SELECT Item_Type, SUM(Total_Sales) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

--  Sales by Outlet Type
SELECT Outlet_Type, SUM(Total_Sales) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

--  Average MRP by Fat Content
SELECT Item_Fat_Content, ROUND(AVG(Item_MRP),2) AS Avg_MRP
FROM blinkit_data
GROUP BY Item_Fat_Content;

--  Total Sales by Outlet Location Type
SELECT Outlet_Location_Type, SUM(Total_Sales) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

--  Outlet Establishment Year vs Sales
SELECT Outlet_Establishment_Year, SUM(Total_Sales) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;
