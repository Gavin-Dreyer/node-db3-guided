-- list of products including the product name and category name
select Category.CategoryName, Product.ProductName Product
from Product
    join Category on Product.CategoryId = Category.Id;

-- list of customers and their order if they have any orders
select *
from Customer as c
    join [Order] as o on c.Id = o.CustomerId
order by c.Id;

-- just to test the following query
select *
from [Order]
-- delete from [Order] 
where CustomerId = 'ALFKI';

-- list of customers that have no order
select *
from Customer as C
    left join [Order] as o on c.Id = o.CustomerId
order by c.Id;

/* GROUPING AND AGGREGATIONS */

-- first we group, then we perform an operation on each group

-- how many orders have been processed
select count(*) as [Total Orders]
from [Order];

-- grouping products by category
select Category.CategoryName, count(*) as Products
from Product
    join Category on Product.CategoryId = Category.Id
group by Category.CategoryName
order by Category.CategoryName;

-- what is our cheapest product?
select Category.CategoryName, min(Product.UnitPrice)
from Product
    join Category on Product.CategoryId = Category.Id
group by Category.CategoryName
order by Category.CategoryName;

-- what is our most expensive product by category?
select Category.CategoryName, max(Product.UnitPrice)
from Product
    join Category on Product.CategoryId = Category.Id
group by Category.CategoryName
order by Category.CategoryName;

-- combined
select Category.CategoryName, count(*), max(Product.UnitPrice), min(Product.UnitPrice)
from Product
    join Category on Product.CategoryId = Category.Id
group by Category.CategoryName
order by Category.CategoryName;

-- list customers and the number of orders they have placed