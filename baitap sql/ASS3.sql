create database Ass3

create table customers(
c_id numeric(9) primary key not null,
c_name nvarchar(30) not null,
city nvarchar(20) not null
);

create table categories(
cat_id int primary key not null,
cat_name nvarchar(30) not null,
);
create table phone(
p_id int identity not null,
phone numeric(10) not null,
cat_id int not null,
c_id numeric(9) not null
primary key (p_id)
foreign key (cat_id) references categories(cat_id),
foreign key (c_id) references customers(c_id)
);

create table sign_in(
s_id int not null,
p_id int not null,
sign_date date not null
primary key (s_id)
foreign key (p_id) references phone(p_id)
);
alter table sign_in add foreign key (p_id) references phone(p_id) on delete cascade

insert into customers values(123456789,'Nguyễn Nguyệt Nga','Ha Noi'),(987654321,'anananan','Quang Ninh')
insert into categories(cat_id,cat_name) values(1,'tra truoc'),(2,'tra sau')
insert into phone(phone,cat_id,c_id) values(1123456789,1,123456789),(2123456789,2,987654321);
insert into sign_in(s_id,p_id,sign_date) values(1,1,'12/12/02'),(2,2,'12/01/03')


-- cau 4
select * from customers
select * from phone

--cau 6
select * from phone where phone=123456789;
select count(phone) from phone;
select count(p_id) from sign_in s where s.sign_date='12/12/02'
select c.c_id,city,phone,p.cat_id from sign_details d full join sign_in s on s.s_id=d.s_id full join customers c on c.c_id=s.c_id full join phone p on p.p_id=d.p_id

--cau 7
update phone set phone=0923456789 where p_id=2 
alter table phone 
add discount int
 
 --cau 8
 create index KH on customers(c_name)
 create view KH as
 select * from customers
 CREATE VIEW TB_KH AS
 SELECT c_name,c.c_id,phone from sign_details d  join sign_in s on s.s_id=d.s_id join customers c on c.c_id=s.c_id  join phone p on p.p_id=d.p_id

 CREATE PROC searchByPhone(@p numeric(10)) AS
 BEGIN 
 SELECT c_name,c.c_id from sign_in s join phone p on p.p_id=s.p_id  join customers c on c.c_id=p.c_id  
WHERE phone=@p
END
EXEC searchByPhone 0912345678

alter PROC newP(@p numeric(10),@c_id numeric(9),@cat_id int) as
begin 
if (not exists(select * from phone where phone=@p) and exists(select *from customers where c_id=@c_id )) insert into phone(phone,cat_id,c_id) values(@p,@cat_id,@c_id ) 
end

alter PROC deleteCus(@c_id int) as
begin 
if (exists(select * from phone where c_id=@c_id)) delete 
from phone
where c_id=@c_id
end
exec deleteCus 123456789
