create database Project_Shopping
use Project_Shopping
drop database Project_Shopping

Create table Category
(Category_Id int identity(1,1) Primary Key,
Category_Name varchar(20))

create table Retailers
(Retail_Id int identity(1000,1) Primary Key,
Company_Name varchar(40),
Retail_Name varchar(40) unique,
Retail_Password nvarchar(40),
Retail_Phone varchar(40),
Retail_Email nvarchar(40),
Retail_Status varchar(40))



Create table Products
(Prod_Id int identity(101,1) Primary Key,
Category_Id int FOREIGN KEY REFERENCES Category(Category_Id),
Prod_Name varchar(20),
Prod_Price decimal,
Prod_Image nvarchar(Max),
Prod_Description varchar(Max),
Prod_Quantity int,
Prod_Status varchar(30),
Retail_Id int FOREIGN KEY REFERENCES Retailers(Retail_Id))






create table Update_Products(
Update_Id int identity(1,1) Primary Key,
Prod_Id int FOREIGN KEY REFERENCES Products(Prod_Id),
Prod_Name varchar(20),
Prod_Price decimal,
Prod_Quantity int,
Update_Status varchar(30))


create table Users(
User_Id int identity(1,1) primary key,
User_Name varchar(50) unique,
User_Password varchar(30),
User_Email nvarchar(50),
User_Phone varchar(15),
User_Address varchar(Max),
User_City varchar(20),
User_Country varchar(30)	
)


create table Wishlist(
Wishlist_Id int identity(101,1) primary key,
User_Id int references Users(User_Id),
Prod_Id int references Products(Prod_Id)
)

create table Cart(
Cart_Id int identity(1,1) primary key,
User_Id int references Users(User_Id),
Prod_Id int references Products(Prod_Id),
Prod_Quantity int ,
Prod_Price decimal
)

create table Orders(
Order_Id int identity(1,1) primary key,
User_id int references Users(User_id),
Prod_id int references Products(Prod_id),
Prod_Price decimal ,
Prod_Quantity int,
Retail_id int references Retailers(Retail_id)
)

create procedure GetAllPdts
as
begin
select * from Products where Prod_Status='approved'
end

exec GetAllPdts

create procedure GetOneCategory (@catid int)
 as
begin
select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Quantity,c.Category_Name from Products p inner join Category c
on p.Category_Id=c.Category_Id
where p.Prod_Status='approved' and p.Prod_Quantity!=0 and c.Category_Id= @catid
end

exec GetOneCategory 2

create procedure GetAllCategory
as
begin
select * from Category 
end

exec GetAllCategory

---------------------------------------------------
create procedure sp_getOrders
(@userid int)
as
begin
select p.Prod_Name,p.Prod_Price,p.Prod_Image,o.Order_Id,o.Prod_Quantity from Products p inner join Orders o
on p.Prod_Id=o.Prod_id
where o.User_id=@userid
end

exec sp_getOrders 1

drop procedure sp_getOrders
---------------------------------------------------

alter procedure sp_getOrdersfromCart
(@userid int)
as
begin
select p.Prod_Name,p.Prod_Price,c.Cart_Id from Products p inner join Cart c
on p.Prod_Id=c.Prod_Id
where c.User_Id=@userid
end

exec sp_getOrdersfromCart 1

------------renaming the column names of cart and orders table to quantity

--sp_rename 'Cart.Quantity','Prod_Quantity','COLUMN'
--sp_rename 'Orders.Quantity','Prod_Quantity','COLUMN'

--------------------create a stored procedure for inserting into orders table and--------------------
--------------------deleting from cart while the user clicks on checkout-----------------------------

create procedure sp_ins_order(@id int)
as
begin
insert into Orders
select c.User_Id,c.Prod_Id,c.Prod_Price,c.Prod_Quantity,p.Retail_Id from Products p inner join Cart c
on c.Prod_Id=p.Prod_Id
where c.User_Id=@id
delete from Cart where User_Id=@id
end

exec sp_ins_order 7


select * from Orders

select * from Cart

--------------------------------------------------------------
create procedure sp_Pdts_Of_One_Category @cat_id int
as
begin
select Prod_Id,Prod_Name,Prod_Image,Prod_Price,Prod_Description,Prod_Quantity,Prod_Status,Category_Name,Retail_Name,
row_number() over (partition by Prod_Name order by Prod_Price,Prod_Id) as row_num
from 
(select p.Prod_Id,p.Prod_Name,p.Prod_Image,p.Prod_Price,p.Prod_Description,p.Prod_Status,p.Prod_Quantity,
c.Category_Name,r.Retail_Name from Products p inner join Category c 
on p.Category_Id=c.Category_Id inner join Retailers r
on p.Retail_Id=r.Retail_Id
where c.Category_Id= @cat_id) as cd
end

exec sp_Pdts_Of_One_Category 3


select * from Products