-- -----------------------------------------------------------------------------------------------------------------------------
-- CREATE TABLE Financial Figures  ---------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------
USE mckinsey;
CREATE TABLE `Financial Figures` (
  `Units` INT,
  `Sales` FLOAT,
  `Cost` FLOAT,
  `Gross Profit` FLOAT,
  `Order ID` INT, -- FK 
  `Factory ID` CHAR(100), -- FK
  `Product ID` CHAR(100), -- FK 
  `Financial Figures ID` INT -- PRIMARY KEY
);
-- ---------------------------------------------------------------------------------------------------
ALTER TABLE `Financial Figures` -- add primary key
ADD PRIMARY KEY (`Financial Figures ID`);
-- ---------------------------------------------------------------------------------------------------
-- PAULINA 
-- create order table
CREATE TABLE `order` (
  `Order ID` INT NOT NULL AUTO_INCREMENT,
  `Customer ID` INT,
  `Order Date` DATE,
  `Ship Date` DATE,
  `Ship Mode` TEXT,
  PRIMARY KEY (`Order ID`)
);

-- insert data in order table
INSERT INTO `order` (`Customer ID`, `Order Date`, `Ship Date`, `Ship Mode`)
SELECT
  `Customer ID`, -- FK
  STR_TO_DATE(`Order Date`, '%Y-%m-%d'),
  STR_TO_DATE(`Ship Date`, '%Y-%m-%d'),
  `Ship Mode`
FROM wonka_choc_factory
GROUP BY
  `Customer ID`, -- FK
  `Order Date`,
  `Ship Date`,
  `Ship Mode`;
  
-- print to see table order
SELECT * FROM `order`
LIMIT 10;

-- ---------------------------------------------------------------------------------------------------
-- add FK Order ID
ALTER TABLE `Financial Figures`
  ADD COLUMN `Order ID`;


-- ALTER TABLE `Financial Figures` 
-- ADD CONSTRAINT `order id`
-- FOREIGN KEY (`Order ID`) REFERENCES `order` (`Order ID`);
-- ---------------------------------------------------------------------------------------------------

SELECT * FROM `Financial Figures`
LIMIT 10;
-- need insert data into the financial figures table
-- --------------------------------------------------------------------------------------------------

-- insert Order ID column from order table into financial figures table specifically the column Order ID
INSERT INTO `financial figures` (`Order ID`)
SELECT `Order ID` FROM `order`;
-- Error Code: 1364. 
-- Field 'Financial Figures ID' doesn't have a default value

-- ---





-- ---------------------------------------------------------------------------------
ALTER TABLE `Financial Figures` -- add FK Product ID
ADD CONSTRAINT `product_figures`
FOREIGN KEY (`Product ID`) REFERENCES `Product` (`Product ID`);

ALTER TABLE `Financial Figures` -- add FK Factory ID
ADD CONSTRAINT `factory_figures`
FOREIGN KEY (`Factory ID`) REFERENCES `Factory` (`Factory ID`);
