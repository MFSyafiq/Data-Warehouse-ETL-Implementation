CREATE DATABASE DWH_Project


CREATE TABLE DimProduct (
	ProductID int NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar(255) NOT NULL,
	PriceUnitProduct int NULL,
	constraint PK_DimProduct Primary Key (ProductID)
);

CREATE TABLE DimCostumer (
	CustomerID int NOT NULL,
	CustomerName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	HPNO varchar (50) NOT NULL
	constraint PK_DimCustomer Primary Key (CustomerID)
);

CREATE TABLE DimOrderStatus (
	StatusID int NOT NULL,
	StatusOrder varchar(50) NOT NULL,
	DescOrderStatus varchar (50) NOT NULL,
	constraint PK_DimOrderStatus Primary Key (StatusID)
);

CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL,
	OrderDate date NOT NULL,
	constraint PK_FactSalesOrder Primary Key (OrderID),
	constraint FK_SalesCustomer Foreign Key (CustomerID) References DimCostumer (CustomerID),
	constraint FK_SalesProduct Foreign Key (ProductID) References DimProduct (ProductID),
	constraint FK_SalesStatus Foreign Key (StatusID) References DimOrderStatus (StatusID)
);

