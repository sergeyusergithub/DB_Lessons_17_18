DROP TABLE Category;

CREATE TABLE Category 
(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name VARCHAR 
);

INSERT INTO Category (name) 
VALUES
    ('SportWatch');
    
INSERT INTO Category (name) 
VALUES
    ('ChildrenWatch');
    
SELECT * FROM Category;

DELETE FROM Category 
WHERE id = 5;

CREATE TABLE Product
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    price INTEGER,
    product_id INTEGER,
    FOREIGN KEY (product_id) REFERENCES Category (id) ON DELETE CASCADE
);

INSERT INTO Product (name,price,product_id)
VALUES
('Xiaomi 001',3000,2);

SELECT * FROM Category,Product 
WHERE product_id = Category.id;

SELECT Category.name, Product.name, price FROM Category,Product 
WHERE product_id = Category.id;

INSERT INTO Product (name,price,product_id)
VALUES
('Citizen 001',5000,1);

SELECT * FROM Product;

DROP TABLE Purchase;

CREATE TABLE Purchase
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    count_products INTEGER,
    data_purchase DATE,
    purchase_id INTEGER,
    FOREIGN KEY (purchase_id) REFERENCES Product (id) ON DELETE CASCADE
);

INSERT INTO Purchase (count_products,data_purchase,purchase_id) 
VALUES
(2,'02-09-2024',1);

INSERT INTO Purchase (count_products,data_purchase,purchase_id) 
VALUES
(5,'01-09-2024',2);

SELECT * FROM Purchase;

CREATE TABLE Customer
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    age INTEGER NOT NULL,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Purchase (id)
    );
    
INSERT INTO Customer (name,gender,age,customer_id)
VALUES
('Tim','Male',26,