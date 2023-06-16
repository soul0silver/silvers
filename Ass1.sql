create table category(
cat_id int identity primary key,
cat_name nvarchar(100) not null
);
--cau 4
select * from sales.customers

select* from production.products

select * from sales.orders

--cau 5
select * from sales.customers order by cus_name asc
select* from production.products order by price desc
select pro_name from sales.orders o join sales.order_detail d on o.order_id=d.order_id
join production.products p on p.pro_id=d.pro_id where o.cus_phone='987654321'

--cau 6
select count(cus_phone) from sales.customers
select count(cat_id) from category
select sum(quantity*price) from sales.order_detail d join sales.orders o on o.order_id=d.order_id join production.products p on p.pro_id=d.pro_id

--cau 7
alter table production.products
add check (price>0)

update sales.orders
set order_date='11/17/09'

alter table production.products
add app_date date


--cau 8
create index index_name on sales.customers (cus_name)
create index index_pname on production.products(pro_name)
create view cus as
select * from sales.customers 
create view prod as
select pro_name,price from production.products

create view cus_pro as
select cus_name,c.cus_phone,pro_name,quantity,order_date from sales.order_detail d join sales.orders o on o.order_id=d.order_id join production.products p on p.pro_id=d.pro_id join sales.customers c on c.cus_phone=o.cus_phone

--cau 8
create proc searchCusById(@id nvarchar(10)) as
select * from cus where cus_phone=@id
exec searchCusById '987654321'
create proc searchCusByOId(@oid int) as
select cus_name,c.cus_phone from sales.customers c join sales.orders o on o.cus_phone=c.cus_phone where order_id=@oid
exec searchCusByOId 123

