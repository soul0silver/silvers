create database Assignment2
use Assignment2
go

create table manage.brand(
b_id int primary key not null identity,
b_name nvarchar(30) not null,
b_address nvarchar(100) not null,
phone char(5) not null
);

create table manage.brand_Details(
b_id int,
cat_id int,
pro_id int ,
quantity tinyint not null
primary key (b_id,cat_id)
constraint D_B foreign key (b_id) references manage.brand(b_id),
	constraint D_C foreign key (cat_id) references production.categorys(cat_id),
	constraint D_P foreign key (pro_id) references production.products(pro_id)
);

create table production.products(
pro_id int identity primary key not null,
pro_name nvarchar(50) not null,
unit nvarchar(10) not null,
price decimal not null

);
alter table production.products
add pro_desc nvarchar(200) not null

create table production.categorys(
	cat_id int identity primary key,
	cat_name nvarchar(30) not null
); 
set IDENTITY_INSERT manage.brand on
insert into manage.brand(b_id,b_name,b_address,phone)
values(123,'ASUS','USA','983232'), 
(121,'SAMSUNG','KOREAN','122333'),
(122,'NOKIA','POLAND','342343');

insert into production.categorys(cat_name)
values('ASUS'), 
('SAMSUNG'),
('FINLAND');

insert into production.products(pro_name,pro_desc,unit,price)
values('Máy Tính T450','Máy nhập cũ','Chiếc',1000), 
('Điện Thoại Nokia5670','Điện thoại đang hot','Chiếc',200),
('Máy In Samsung 450','Máy in đang loại bình','Chiếc',100);


insert into manage.brand_Details(b_id,cat_id,pro_id,quantity)
values(123,1,1,10),
(122,2,2,200),
(121,3,3,10);


--cau 4
select *from manage.brand
select *from production.products

--cau 5
select *from manage.brand order by b_name DESC
select *from production.products order by price DESC
select *from manage.brand where b_name='ASUS'
select 
pro_name,
quantity
from manage.brand_Details bd
join production.products p on p.pro_id=bd.pro_id
where quantity<11 
select 
pro_name
from manage.brand_Details bd
join production.products p on p.pro_id=bd.pro_id 
where b_id=123

--cau 6
select 
COUNT (b_id) from manage.brand
select count (cat_id)  from production.categorys
select sum(quantity) from manage.brand_Details bd where bd.b_id=123
select COUNT(pro_id) from production.products

--cau 7
alter table production.products
add check (price >0);
update manage.brand
SET phone = CONCAT('0', SUBSTRING(phone,2, 6))
select phone from manage.brand
EXEC sp_helpindex 'manage.brand_Details'
exec sp_fkeys 'manage.brand_Details'

--cau 8
create index number on production.products(pro_name,pro_desc);

create view prod as
select 
pro_id,
pro_name,
price
from production.products
create view details as
select
quantity,
production.products.pro_id,
production.products.pro_name,
manage.brand.b_name
from production.products 
join manage.brand_Details  on manage.brand_Details.pro_id=production.products .pro_id
join manage.brand  on manage.brand.b_id=manage.brand_Details.b_id

create procedure addNew(@b_name nvarchar(30))
as
begin
select pro_name from details where b_name = @b_name
end

exec addNew 'NOKIA'

create procedure searchByPrice(@price int) as
begin
select* from prod where price>=@price
end
exec searchByPrice 100

create procedure searchByQua(@qua int) as
begin
select pro_id,pro_name from details where quantity=@qua
end
exec searchByQua 0