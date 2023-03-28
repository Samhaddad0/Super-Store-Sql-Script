#1 Find the max quantity sold in a transcation 
select max(Quantity), count(*)
from tr_orderdetails;

#2 Find the unique product in all transcations, and check if they solid the max quanitiy  
select distinct ProductID, Quantity  
from tr_orderdetails
where Quantity = 3
order by ProductID asc, Quantity desc;

#3 Find unique prperties 
select distinct propertyID
from tr_orderdetails;

#4 Find the product category that has max products
select Productcategory, count(*) as Quantity  
from tr_products
group by ProductCategory
order by 2 desc; 

#5 Find the state where most stores are present
select PropertyState, count(*) as COUNT  
from tr_propertyinfo
group by PropertyState
order by 2 desc;

#6 Find the top 5 product IDs that did max sales in terms of quantity 
select ProductID, sum(Quantity) as Total_Quantity   
from tr_orderdetails
group by ProductID
order by 2 desc
limit 5;

#7 Find the top 5 propeties IDs that did max quantity
select PropertyID, sum(Quantity) as Total_Quantity   
from tr_orderdetails
group by PropertyID
order by 2 desc
limit 5;

#8 Find the top 5 products names that did max sales in terms of quantity
select 
p.ProductName, sum(Quantity) as Total_Quantity 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 desc;  

#9 Find the top 5 products that did max sales
select 
p.ProductName, sum(o.Quantity * p.Price) as Sales  
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName 
order by sales desc
limit 5; 

#10 Find the top 5 cities that did max sales 
select 
pi.PropertyCity, sum(o.Quantity * p.Price) as Sales  
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.'Prop ID'
group by pi.PropertyCity 
order by sales desc
limit 5; 


 


