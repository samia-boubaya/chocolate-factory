-- -----------------------------------------------------------------------------------------------------------------------------
-- CREATE TABLE Order  ---------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------
USE mckinsey;
CREATE TABLE `order` (
    `Order ID` CHAR(100) PRIMARY KEY,
    `Order Date` CHAR(100),
    `Customer ID` INT,
    `Product ID` CHAR(100),
    `Ship Date` CHAR(100),
    `Ship Mode` CHAR(100)
);


INSERT INTO `order` (`Order ID`, `Order Date`, `Customer ID`, `Ship Date`, `Ship Mode`)
SELECT 
    CONCAT(CAST(`Order Date` AS CHAR), '_', CAST(`Customer ID` AS CHAR), '_', CAST(`Product ID` AS CHAR)) AS `Order ID`,
    `Order Date`,
    `Customer ID`,
    `Ship Date`,
    `Ship Mode`
FROM wonka_choc_factory;


-- -----------------------------------------------------------------------------------------------------------------------------
-- CREATE TABLE Product --------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------

-- Product ID  mapping -----------------------------------------------------------------------------------------------------------------
USE mckinsey;
CREATE TABLE `Product`
AS
SELECT mckinsey.wonka_choc_factory, 
    CASE
        WHEN `Product Name` = 'Wonka Bar' THEN 'WB'
        WHEN `Product Name` = 'Wonka Bar - Triple Dazzle Caramel' THEN 'WBTC'
        WHEN `Product Name` = 'Wonka Bar - Scrumdiddlyumptious' THEN 'WBSL'
        WHEN `Product Name` = 'Wonka Bar -Scrumdiddlyumptious' THEN 'WBSL'
        WHEN `Product Name` = 'Wonka Bar - Fudge Mallows' THEN 'WBFM'
        WHEN `Product Name` = 'Wonka Bar - Milk Chocolate' THEN 'WBMC'
        WHEN `Product Name` = 'Wonka Bar - Nutty Crunch Surprise' THEN 'WBNS'
        WHEN `Product Name` = 'Wonka Gum' THEN 'WG'
        WHEN `Product Name` = 'SweeTARTS' THEN 'ST'
        WHEN `Product Name` = 'Lickable Wallpaper' THEN 'LW'
        WHEN `Product Name` = 'Kazookles' THEN 'KK'
        WHEN `Product Name` = 'Everlasting Gobstopper' THEN 'EG'
        WHEN `Product Name` = 'Fizzy Lifting Drinks' THEN 'FL'
        WHEN `Product Name` = 'Nerds' THEN 'ND'
        WHEN `Product Name` = 'Fun Dip' THEN 'FD'
        WHEN `Product Name` = 'Laffy Taffy' THEN 'LT'
        WHEN `Product Name` = 'Hair Toffee' THEN 'HT'
        ELSE NULL
    END AS `Product ID`
FROM `wonka_choc_factory` mckinsey;

CREATE TABLE `Product` (
    `Product ID` CHAR(100),
    `Factory ID` CHAR(100),
    `Product Name` INT,
    `Division` CHAR(100),
	PRIMARY KEY (`Product ID`),
    CONSTRAINT `customer_factory_relationship` FOREIGN KEY (`Factory ID`)
        REFERENCES `wonka_choc_factory` (`Factory`)
);

-- Product TABLE -------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE `Product`(
    `Product ID` CHAR(10) PRIMARY KEY,
    `Factory ID` CHAR(100),
	`Product Name` VARCHAR(100),
    `Division` CHAR(100)wonka_choc_factory,
    CONSTRAINT `customer_factory_relationship` FOREIGN KEY (`Factory ID`) REFERENCES `wonka_choc_factory` (`Factory ID`)
);

INSERT INTO Product (Factory_ID, Product_ID, Product_Name)
SELECT 
    Factory_ID,
    CASE
        WHEN `Product Name` = 'Wonka Bar' THEN 'WB'
        WHEN `Product Name` = 'Wonka Bar - Triple Dazzle Caramel' THEN 'WBTC'
        WHEN `Product Name` = 'Wonka Bar - Scrumdiddlyumptious' THEN 'WBSL'
        WHEN `Product Name` = 'Wonka Bar -Scrumdiddlyumptious' THEN 'WBSL'
        WHEN `Product Name` = 'Wonka Bar - Fudge Mallows' THEN 'WBFM'
        WHEN `Product Name` = 'Wonka Bar - Milk Chocolate' THEN 'WBMC'
        WHEN `Product Name` = 'Wonka Bar - Nutty Crunch Surprise' THEN 'WBNS'
        WHEN `Product Name` = 'Wonka Gum' THEN 'WG'
        WHEN `Product Name` = 'SweeTARTS' THEN 'ST'
        WHEN `Product Name` = 'Lickable Wallpaper' THEN 'LW'
        WHEN `Product Name` = 'Kazookles' THEN 'KK'
        WHEN `Product Name` = 'Everlasting Gobstopper' THEN 'EG'
        WHEN `Product Name` = 'Fizzy Lifting Drinks' THEN 'FL'
        WHEN `Product Name` = 'Nerds' THEN 'ND'
        WHEN `Product Name` = 'Fun Dip' THEN 'FD'
        WHEN `Product Name` = 'Laffy Taffy' THEN 'LT'
        WHEN `Product Name` = 'Hair Toffee' THEN 'HT'
        ELSE NULL
    END AS Product_ID,
    `Product Name` FROM wonka_choc_factory;

-- Product  INSERT--------------------------------------------------------------------------------------------------------------------------------


-- Populate the table with data from wonka_choc_factory, generating Order ID
INSERT INTO `order` (`Order ID`, `Order Date`, `Customer ID`, `Ship Date`, `Ship Mode`)
SELECT 
    CONCAT(CAST(`Order Date` AS CHAR), '_', CAST(`Customer ID` AS CHAR))
    `Order Date`,
    `Customer ID`,
    `Ship Date`,
    `Ship Mode`
FROM wonka_choc_factory;

-- Product ID  mapping ----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE `order` (
    `Order ID` CHAR(100) PRIMARY KEY,
    `Order Date` CHAR(100),
    `Customer ID` INT,
    `Ship Date` CHAR(100),
    `Ship Mode` CHAR(100),
    CONSTRAINT `order_customer_relationship` FOREIGN KEY (`Customer ID`)
        REFERENCES `wonka_choc_factory` (`Customer ID`)
);
-- Generate Order ID & Populate the table with data from wonka_choc_factory -----------------------------------------------------------------------

-- Populate the table with data from wonka_choc_factory, 
-- Generating Order ID
INSERT INTO `order` (`Order ID`, `Order Date`, `Customer ID`, `Ship Date`, `Ship Mode`)
SELECT 
    CONCAT(CAST(`Order Date` AS CHAR), '_', CAST(`Customer ID` AS CHAR), '_', CAST(`Product ID` AS CHAR)) AS `Order ID`,
    `Order Date`,
    `Customer ID`,
    `Ship Date`,
    `Ship Mode`
FROM wonka_choc_factory;
