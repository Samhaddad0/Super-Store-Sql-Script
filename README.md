📌 Project Overview

This project showcases a set of SQL queries designed to explore and analyze a retail-style transactional database. The dataset includes product information, order details, and store/property metadata.
The queries answer core business questions such as:

-Which products sell the most?
-Which stores generate the highest sales?
-Which product categories are strongest?
-What geographic regions drive the most store presence and revenue?

This project demonstrates foundational SQL analytics skills including aggregation, grouping, joins, distinct filtering, ranking, and exploratory data analysis.

🧵 Dataset Description

1. tr_orderdetails
-Contains transaction-level data.
-Key fields: ProductID, PropertyID, Quantity

2. tr_products
-Product catalog file.
-Key fields: ProductID, ProductName, ProductCategory, Price

3. tr_propertyinfo
-Store/location metadata.
-Key fields: Prop ID (PropertyID), PropertyState, PropertyCity

🎯 Business Questions

1️⃣ What is the maximum quantity sold in any transaction?
select max(Quantity), count(*) from tr_orderdetails;

2️⃣ Which unique products hit the maximum quantity sold?
select distinct ProductID, Quantity  
from tr_orderdetails
where Quantity = 3
order by ProductID asc, Quantity desc;

3️⃣ What store properties appear in the dataset?
select distinct propertyID from tr_orderdetails;

4️⃣ Which product category has the highest number of products?
select Productcategory, count(*) as Quantity  
from tr_products
group by ProductCategory
order by 2 desc;

5️⃣ Which state has the most store locations?
select PropertyState, count(*) as COUNT  
from tr_propertyinfo
group by PropertyState
order by 2 desc;

6️⃣ What are the top 5 products by total quantity sold?
select ProductID, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by ProductID
order by 2 desc
limit 5;

7️⃣ What are the top 5 properties by quantity sold?
select PropertyID, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by PropertyID
order by 2 desc
limit 5;

8️⃣ Which product names sold the most units?
select 
p.ProductName, sum(Quantity) as Total_Quantity 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 desc;

9️⃣ Which products generated the highest revenue?
select 
p.ProductName, sum(o.Quantity * p.Price) as Sales  
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName 
order by sales desc
limit 5;


🔟 Which cities generated the highest sales revenue?
select 
pi.PropertyCity, sum(o.Quantity * p.Price) as Sales  
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
