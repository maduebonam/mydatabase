
-- INSERTING THIS SAMPLE DATA
INSERT INTO CUSTOMER (CustomerID, Name, Address, PhoneNumber)
VALUES (1, 'John Doe', '123 Street', '1234567890');

INSERT INTO PRODUCT (ProductID, ProductName, Price, Category)
VALUES (1, 'Laptop', 999.99, 'Electronics');

INSERT INTO ORDERS (OrderID, CustomerID, OrderDate)
VALUES (1, 1, SYSDATE);



CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50) NOT NULL,
    CustomerAddress VARCHAR2(100),
    CustomerPhone VARCHAR2(15) UNIQUE
);

CREATE TABLE PRODUCT (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(50) NOT NULL,
    Price NUMBER(10, 2) NOT NULL
);

CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER(5) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_product FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE SUPPLIER (
    SupplierID NUMBER PRIMARY KEY,
    SupplierName VARCHAR2(50) NOT NULL,
    SupplierPhone VARCHAR2(15) UNIQUE
);

CREATE TABLE SUPPLIES (
    SupplierID NUMBER,
    ProductID NUMBER,
    SupplyDate DATE,
    Quantity NUMBER(5),
    CONSTRAINT fk_supplier FOREIGN KEY (SupplierID) REFERENCES SUPPLIER(SupplierID),
    CONSTRAINT fk_supplies_product FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    PRIMARY KEY (SupplierID, ProductID, SupplyDate)
);


-- Add Category column to PRODUCT table
ALTER TABLE PRODUCT
ADD Category VARCHAR2(20);

-- Add OrderDate column to ORDERS table with default value as SYSDATE
ALTER TABLE ORDERS
ADD OrderDate DATE DEFAULT SYSDATE;

