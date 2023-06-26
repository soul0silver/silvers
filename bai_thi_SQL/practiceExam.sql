-- 1
create database NTB_DB;
use NTB_DB
go;
--2
create table Region(
LocationID char(6) primary Key,
Locat_name nvarchar(50) not null,
Locat_desc nvarchar(100)
); 

create table Land(
LandID int primary key identity,
title nvarchar(100) not null,
LocationID char(6),
detail nvarchar(1000),
startDate datetime Not null,
endDate datetime Not null
foreign key (LocationID) references Region(LocationID)
); 

create table Building(
BuildingID int primary key identity,
LandID int ,
BuildingType nvarchar(50),
Area int default 50,
floors int default 1,
rooms int default 1,
cost money
foreign key (LandID) references Land(LandID)
); 

--3
insert into Region 
values('880000','An Giang','An Giang province'),
('260000','Bac Lieu','Bac Lieu province'),
('960000','Bac Can','Can province');

insert into Land
values ('Chau Doc','880000',null,'2023-06-01 00:00:00','2023-07-01 00:00:00'),
('Dong Hai','260000',null,'2023-07-01 00:00:00','2023-08-01 00:00:00'),
('ba be','960000',null,'2023-08-01 00:00:00','2023-09-01 00:00:00');

insert into Building
values (2,'office',100,4,8,1000),
(1,'house',102,1,4,2100),
(2,'office',130,2,8,2000),
(3,'house',107,4,4,1700),
(2,'office',150,2,8,1600),
(1,'house',112,1,6,1300);

--4
select * from Building where Area>=100;
--5
select * from Land where convert(date,endDate)<'2013-01-01';
--6
select b.* from Building b JOIN Land l on b.LandID=l.LandID where title='My Dinh';
--7
create view v_Building as
select BuildingID,title,r.Locat_name as Name,BuildingType,Area,floors from Building b join Land l on l.LandID=b.LandID 
join Region r on r.LocationID = l.LocationID;

--8
create view v_TopBuildings as
select top(5)* from Building order by cost desc

--9
create proc sp_SearchLandByLocation(@LocationID char(6))  as
begin 
select * from Land where LocationID=@LocationID;
end;
exec sp_SearchLandByLocation 880000;
--10
create proc sp_SearchBuidingByLand(@LandID int)  as
begin 
select * from Building where LandID=@LandID;
end;
exec sp_SearchBuidingByLand 2;