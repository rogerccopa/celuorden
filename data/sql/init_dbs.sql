-- databases: coadmin and co1001 must exist first.
USE coadmin;
CREATE TABLE companies(
	id int not null identity(1,1) primary key,
	company varchar(30) not null,
	address varchar(30),
	region varchar(15),
	country varchar(15),
	phone varchar(15),
	email varchar(30),
	dbname varchar(15)
);
CREATE TABLE users(
	id int not null identity(1,1) primary key,
	fullname varchar(30),
	username varchar(30) not null,
	password varchar(15) not null,
	user_type smallint, -- 0=attendant 1=cook 2=cashier 3=admin
	company_id int not null,
);
-- INSERT initial data
INSERT INTO companies(company, address, region, country, phone, email, dbname)
VALUES ('FIRST Company', 'Calle Union C5 Las Joyas', 'Cusco', 'Peru', '984-757850', 'rogerccopa@yahoo.com', 'CeluOrden101');
DECLARE @companyId1 as int = SCOPE_IDENTITY();
INSERT INTO companies(company, address, region, country, phone, email, dbname)
VALUES ('SECOND Company', 'Calle Union C5 Las Joyas', 'Cusco', 'Peru', '984-293729', 'croquetenrique@yahoo.com', 'CeluOrden102');
DECLARE @companyId2 as int = SCOPE_IDENTITY();

INSERT INTO users(company_id, fullname, username, password, user_type)
VALUES (@companyId1, 'Waiter One', 'waiter1', 'waiter1', 0); -- 0=attendant 1=cook 2=cashier 3=admin
INSERT INTO Users(company_id, fullname, username, password, user_type)
VALUES (@companyId1, 'Cook One', 'cook1', 'cook1', 1);
INSERT INTO Users(company_id, fullname, username, password, user_type)
VALUES (@companyId1, 'Cashier One', 'cashier1', 'cashier1', 2);
INSERT INTO Users(company_id, fullname, username, password, user_type)
VALUES (@companyId1, 'Admin User', 'admin', 'admin', 3);


USE co1001;
CREATE TABLE menu_items(
	id int not null identity(1,1) primary key,
	title varchar(30) not null,
	description varchar(90),
	price decimal(9,2),
	is_available tinyint DEFAULT 1
);
CREATE TABLE orders(
	id int not null identity(1,1) primary key,
	user_id int,
	table_number smallint not null,
	created_at smalldatetime,
	fulfilled_at smalldatetime,
	payed_at smalldatetime,
	total decimal(9,2),
	state smallint DEFAULT 0 -- 0=new 1=inprocess 2=ready 3=payed 4=canceled
);
CREATE TABLE order_items(
	id int not null identity(1,1) primary key,
	menu_item_id int not null,
	price decimal(9,2),
	quantity smallint,
	subtotal decimal(9,2),
	created_at smalldatetime,
	note varchar(30)
);
-- INSERT initial data
INSERT INTO menu_items(title, description, price)
VALUES  ('Ceviche + Arroz Chaufa', 'Ceviche de tilapia con arroz chaufa mas chilcano y refresco', 17.50),
		('Arroz Con Mariscos', 'Delicioso arroz chaufa con mix de mariscos del mar y su chilcano de cortesia', 27.00),
		('Parihuela', 'Mix especial de cangrejo y pescado del dia mas su chilcano de cortesia', 30.00)
