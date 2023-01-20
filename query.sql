CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY, 
name VARCHAR(255) NOT NULL);

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
name VARCHAR(255) NOT NULL);

CREATE TABLE ProductCategories(
ProductsID INT NOT NULL,
CategoriesID INT NOT NULL,
FOREIGN KEY(ProductsID) REFERENCES Products(Id) ON DELETE CASCADE,
FOREIGN KEY(CategoriesID) REFERENCES Categories(Id) ON DELETE CASCADE);

INSERT INTO Products
VALUES
	('War and Peace'),
	('Chips'),
	('Cola'),
	('Washer'),
	('Toaster'),
	('Gaming PC');


INSERT INTO Categories
VALUES
	('Book'),
	('Food'),
	('Appliance');

INSERT INTO ProductCategories
VALUES
	(1, 1),
	(2, 2),
	(3, 2),
	(4, 3),
	(5, 3);

SELECT P."Name", C."Name"
FROM Products P
LEFT JOIN ProductCategories PC
	ON P.Id = PC.ProductsID
LEFT JOIN Categories C
	ON PC.CategoriesID = C.Id;