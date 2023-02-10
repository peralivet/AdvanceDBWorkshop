"Write a SELECT statement that lists the customers first name, middle name and
last name along with their ID numbers from the SalesLT.Customers table"
select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c

"write a SELECT statement that lists the Product ID, name, 
product number, and color of each product from the SalesLT.Product table."

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" 
FROM SalesLT.Product p

"Now write a SELECT statement that lists the sales order ID, customer ID 
and Order date from the SalesLT.SalesOrderHeader table."

SELECT
s.SalesOrderID 'Sales ID',s.CustomerID 'Customer ID',s.OrderDate 'Order Date'
FROM
SalesLT.SalesOrderHeader s


"Write a query using a WHERE clause that displays all the Customers listed in the SalesLT.Customers 
table who have the Last Name 'Johnson'. Display customers first name, middle name and last name along with their ID numbers"

select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c where c.LastName = 'Johnson'

"Now write a query using a WHERE clause that displays all the Customers listed in the SalesLT.Customers table who have the Last Name
 "'Adams'" or "'Alexander'". Display customers first name, middle name and last name along with their ID numbers."

 select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c where c.LastName = 'Adams' or c.LastName = 'Alexander'

"Write a query using a WHERE clause that displays all the Customers 
listed in the SalesLT.Customers table who have the First Name "'Robert'" and Last Name "'Brown'". Display all the columns."

select 
    *
FROM SalesLT.Customer c where  c.FirstName = 'Robert' and c.LastName = 'Brown'

"Write a query using a WHERE clause that displays all the Prodcuts listed in the 
SalesLT.Product where the List Price exceeds $1000. Display all the columns."

SELECT *
FROM SalesLT.product sp
WHERE sp.listprice >1000

'Write a query displaying all the columns of the SalesLT.Product table 
from the rows that were removed from sale on the 30th June 2007.'

SELECT *
FROM SalesLT.product sp
WHERE sp.SellEndDate = '2007-06-30'

'Write a query displaying all the columns of the SalesLT.Customers 
table from the rows that were modified on 2005-08-01.'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate = '2005-08-01'

'Rewrite the last query so that the rows that were not modified on 2005-08-01, are displayed.
'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate != '2005-08-01'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate <> '2005-08-01'

'Write a query displaying all the columns of the SalesLT.Customers 
table from the rows that were modified between 2005-07-01 and 2007-07-01.'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate between '2005-07-01' AND '2007-07-01'

'Rewrite the query from question 11 so that it displays 
only the rows modified during December 2005 or December 2006.'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate between '2005-12-01' AND '2005-12-31'
or modifiedDate between '2006-12-01' AND '2006-12-31'

'Write a query displaying all the columns of the SalesLT.Customers 
table from the rows that were modified after 31st December 2006.'

SELECT *
FROM SalesLT.customer
WHERE modifiedDate > '2006-12-31'

'Write a query that displays the product ID and Name for each product 
from the SalesLT.Product table with a name starting with "Mountain".'

SELECT *
FROM SalesLT.product sp
WHERE sp.name like 'Mountain%'

'Write a query like the one in question 14 that displays the products with "Socks" 
anywhere in the product name.'

SELECT *
FROM SalesLT.product sp
WHERE sp.name like '%Socks%'

'Change the last query so that the products without "Socks" in the name are displayed.'

SELECT *
FROM SalesLT.product sp
WHERE sp.name not like '%Socks%'

'Write a query that displays the product ID, Name and Color for each product from 
the SalesLT.Product table with a name starting with "Touring" but not ending with "Wheel".'

SELECT ProductID, name, color
FROM SalesLT.product sp
WHERE sp.name  like 'Touring%' and sp.name not like '%Wheel'

'Write a query using a WHERE clause that displays all the Customers listed in the SalesLT.Customers 
table who have the First Name starting with "K" and ending with "E". 
Display customers first name, middle name and last name along with their ID numbers.'

select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c
where c.firstname  like 'K%' and c.firstname like '%E'

'Change the last query so that the Customers who have the First Name starting 
with "K" and ending with "E" or "A" are displayed.'

select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c
where c.firstname  like 'K%[AE]'  


'Write a query that displays the product ID, Name and Color for each product from 
the SalesLT.Product table with a product name ending with numbers.'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" 
FROM SalesLT.Product p
WHERE p.name like '%[0-9]'


'Write a query so that the product names starting with the letters L, M or N, are displayed.'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" 
FROM SalesLT.Product p
WHERE p.name like '[L,M,N]%'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" 
FROM SalesLT.Product p
WHERE p.name like '[L-N]%'

'Write a query that displays all the columns for each product from 
the SalesLT.Product table with a product name NOT ending with numbers.'

select 
   *
FROM SalesLT.Product p
WHERE p.name not like '%[0-9]'

'Write a query displaying the ProductID, Name, Color and List Price columns from rows in 
the SalesLT.Product table. Display only those rows where no color has been assigned.'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" , p.listprice "List Price"
FROM SalesLT.Product p
WHERE p.color is null

'Write a query displaying the ProductID, Name, Color and List Price columns from rows in the SalesLT.Product 
table. Display only those rows in which the color is known not to be blue.'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" , p.listprice "List Price"
FROM SalesLT.Product p
WHERE p.color = 'blue'

select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" , p.listprice "List Price"
FROM SalesLT.Product p
WHERE p.color in ('blue')

'Write a query displaying the ProductID, Name, Color and List Price columns from rows in the SalesLT.Product table.
 Display only those rows in which the color is known not to be blue.'

 select 
    p.ProductID "Product ID",p.Name "Product Name",p.Color "Product Color" , p.listprice "List Price"
FROM SalesLT.Product p
WHERE p.color not in ('blue')

'Write a query displaying ProductID, Name, Size, Weight and Color from the SalesLT.Product table. 
Include only the rows where at least one of the Size, Weight or Color columns contains a value.'

 select 
    p.ProductID "Product ID",p.Name "Product Name",
    p.Color "Product Color" , p.Size "Product Size",
    p.weight "Product Weight"
FROM SalesLT.Product p
WHERE p.color is not null or p.weight is not null or p.color is not null

'Write a query displaying Product Name,List Price, Size and Color from the 
SalesLT.Product table. Include only the rows where both Size and Color columns are NULL.'

 select 
    p.ProductID "Product ID",p.Name "Product Name",
    p.Color "Product Color" , p.Size "Product Size" 
FROM SalesLT.Product p
WHERE p.size is null and p.color is  null

'Write a SELECT statement that lists the customers first name, middle name and last name along with their ID numbers from
 the SalesLT.Customers table. Sort the results by LastName, FirstName and MiddleName.'

 select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c
order by c.LastName,c.FirstName,c.MiddleName

'Modify the query written in the previous 
question so that the data is returned in the opposite order.'

 select 
    c.CustomerID "Customer ID",c.FirstName "First Name",c.MiddleName "Middle Name",c.LastName "Last Name" 
FROM SalesLT.Customer c
order by c.LastName desc,c.FirstName desc,c.MiddleName desc


