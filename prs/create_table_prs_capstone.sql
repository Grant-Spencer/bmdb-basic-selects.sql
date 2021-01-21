-- Create and Select the Database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create User table
-- Drop table if exists user;
create table User(
ID				Int				primary key auto_increment,
Username		Varchar(20)		Not null,
password		varchar(10)		Not null,
firstname		varchar(20)		Not null,
lastname		varchar(20)		Not null,
phonenumber		varchar(12)		Not null,
email			varchar(75)		Not null,
IsReviewer		tinyint			default 0 Not null,
Isadmin			tinyint			default 0 Not null,
Constraint uname unique(username));

Create table vendor(
ID				int				primary key auto_increment,
Code			varchar(10)		Not null,
Name			varchar(255)	Not null,
Address			Varchar(255)	Not null,	
City			Varchar(255)	Not null,
State			varchar(2)		Not null,
Zip				varchar(5)		Not null,
Phonenumber		varchar(12)		Not null,
Email			varchar(100)	Not null,
Constraint vcode unique (code));

Create table request(
ID 						INT					Not null,	
UserID 					INT					Not null,
Description		 		VARCHAR(100)		Not null,
Justification	 		VARCHAR(255)		Not null,
DateNeeded 				DATE				Not null,
DeliveryMode 			VARCHAR(25)			Not null,
Status 					VARCHAR(20)			Not null default 'New',
Total 					DECIMAL(10,2)		Not null,
SubmittedDate 			DATETIME			default current_timestamp Not null,
ReasonForRejection 		VARCHAR(100),
Foreign Key (UserID) references user (ID)
);

create table product(
ID 				INT					primary key auto_increment,
VendorID 		INT					Not null,
PartNumber 		VARCHAR(50)			Not null,
Name 			VARCHAR(150)		Not null,
Price 			DECIMAL(10,2)		Not null,
Unit 			VARCHAR(255),
PhotoPath 		VARCHAR(255),
foreign key (vendorID) references vendor(ID),
constraint vendor_part unique (vendorID, partnumber));

create table lineitem(
ID 			INT				primary key auto_increment,
RequestID 	INT				Not null,
ProductID 	INT				Not null,
Quantity 	INT				Not null,
foreign key (productID) references product(ID),
foreign key (requestID) references request(ID),
constraint req_pdt unique (requestID, productID)
);

-- Add Users

insert into user values
(1, 'SYSTEM', 'XXXXX', 'System', 'System', '513-513-5135', 'system@test.com', 0, 0),
(2, 'Grant', 'sesame', 'Grant', 'Spencer', '513-646-2299', 'gwspence22@gmail.com', 0, 0);

-- Add Vendor
insert into vendor values
('1', 'bb-1001', 'Best Buy', '100 Best Buy Street', 'Louisville', 'KY', '40207', 502-111-9099, 'geeksquad@bestbuy.com'),
('2', 'AP-1001', 'Apple Inc', '1 Infinite Loop', 'Cupertino', 'CA', '95014', 800-123-4567, 'Genius@apple.com'),
('3', 'AM-1001', 'Amazon', '410 Terry Ave. North', 'Seattle', 'WA', '98109', 206-266-1000, 'amazon@amazon.com'),
('4', 'ST-1001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', 45040, 513-754-0235, 'support@orders.staples.com'),
('5', 'MC-1001', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', 45241, 513-782-8500, 'support@microcenter.com');

-- add product
insert into product values
(1,'1','ME280LL','ipad mini 2',296.99),
(2,'2','ME280LL','ipad mini 2',299.99),
(3,'3','105810', 'Hammermill Paper, Premium Multi-purpose paper poly wrap', 8.99, '1 ream / 500 sheets'),
(4,'4','122374', 'Hammermill Copy Plus copy Paper, 8 1/2" x 11", Case', 29.99, '1 case, 10 reams, 500 sheets per ream'),
(5,'4','784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black', 14.99),
(6,'4','382955', 'Staples Mouse Pad. Black', 2.99),
(7,'4''2122178', 'AOC 24-Inch Class LED Monitor', 99.99),
(8,'4','2460649', 'Laptop HP Notebook 15-AY163NR', 529.99),
(9,'4','2256788', 'Laptop Dell i3552-3240BLK 15.6"', 239.99),
(10,'4','IM12M9520', 'Laptop Acer ACER Aspire One Cloudbook 14"', 224.99),
(11,'4','940600', 'Canon imageCLASS Copier (D530)', 99.99),
(12,'5','228148', 'Acer Aspire ATC-780A-UR12 Desktop Computer', 399.99, '/images/AcerAspireDesktop.jpg'),
(13,'5','279364', 'Lenovo IDeaCentre All-In-One Desktop', 349.99, '/images/LenovoIdeaCenter.jpg');

DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
