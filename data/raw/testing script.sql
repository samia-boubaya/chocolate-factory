-- =============================================================================
-- CREATE TABLE Financial Figures  ---------------------------------------------
-- =============================================================================
USE mckinsey;
CREATE TABLE `Financial Figures` (
  `Financial Figures ID` INT NOT NULL AUTO_INCREMENT, -- PRIMARY KEY
  `Units` INT,
  `Sales` FLOAT,
  `Cost` FLOAT,
  `Gross Profit` FLOAT,
  `Order ID` INT, -- FK 
  `Factory ID` CHAR(100), -- FK
  `Product ID` CHAR(100),  -- FK 
  PRIMARY KEY (`Financial Figures ID`)
);

-- ---------------------------------------------------------------------------------------------------
-- ALTER TABLE `Financial Figures` -- add primary key
-- ADD PRIMARY KEY (`Financial Figures ID`);
-- ---------------------------------------------------------------------------------------------------
-- PAULINA 
-- create order table
CREATE TABLE `order` (
  `Order ID` INT NOT NULL AUTO_INCREMENT,
  `Customer ID` INT, -- FK needs a constraint
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

-- ---




-- =============================================================================
-- FACTORY TABLE
-- =============================================================================
USE mckinsey;
CREATE TABLE `Factory` (
  `Factory ID` CHAR(50) NOT NULL,   -- primary key
  `Longitude`  FLOAT,
  `Latitude`   FLOAT,
  PRIMARY KEY (`Factory ID`)
);

INSERT INTO `Factory` (`Factory ID`, `Longitude`, `Latitude`)
SELECT DISTINCT
       `Factory`   AS `Factory ID`,
       `Longitude`,
       `Latitude`
FROM `wonka_choc_factory`;

SELECT * FROM `Factory`;
-- =============================================================================
-- PRODUCT TABLE
-- =============================================================================
CREATE TABLE `Product`(
	`Product ID` CHAR(50), -- primary key
    `Factory ID` CHAR(50), -- foreign key from factory
    `Product Name` VARCHAR(50),
    `Division`VARCHAR(50),
    PRIMARY KEY (`Product ID`)
);
-- print 
SELECT * FROM `Product`;
-- 
USE mckinsey;
INSERT INTO `Product` (`Product ID`, `Factory ID`, `Product Name`, `Division`)
SELECT *
FROM (
  SELECT DISTINCT
    CASE `Product Name`
      WHEN 'Wonka Bar'                         THEN 'WB'
      WHEN 'Wonka Bar - Triple Dazzle Caramel' THEN 'WBTC'
      WHEN 'Wonka Bar - Scrumdiddlyumptious'   THEN 'WBSL'
      WHEN 'Wonka Bar - Fudge Mallows'         THEN 'WBFM'
      WHEN 'Wonka Bar - Milk Chocolate'        THEN 'WBMC'
      WHEN 'Wonka Bar - Nutty Crunch Surprise' THEN 'WBNS'
      WHEN 'Wonka Gum'                         THEN 'WG'
      WHEN 'SweeTARTS'                         THEN 'ST'
      WHEN 'Lickable Wallpaper'                THEN 'LW'
      WHEN 'Kazookles'                         THEN 'KK'
      WHEN 'Everlasting Gobstopper'            THEN 'EG'
      WHEN 'Fizzly Lifting Drinks'             THEN 'FLD'
      WHEN 'Nerds'                             THEN 'ND'
      WHEN 'Fun Dip'                           THEN 'FD'
      WHEN 'Laffy-Taffy'                       THEN 'LT'
      WHEN 'Hair Toffee'                       THEN 'HT'
      ELSE NULL
    END       AS `Product ID`,
    `Factory` AS `Factory ID`,
    `Product Name`,
    `Division`
  FROM `wonka_choc_factory`
) AS t
WHERE `Product ID` IS NOT NULL;

SELECT * FROM `Product`;

-- CONSTRAINT 
ALTER TABLE `Product`
    ADD CONSTRAINT `product_factory_relationship` 
		FOREIGN KEY (`Factory ID`) 
        REFERENCES `Factory`(`Factory ID`);




-- ------------------------------------------------------------------------------------------
ALTER TABLE `Financial Figures` -- add FK Product ID
ADD CONSTRAINT `product_figures`
FOREIGN KEY (`Product ID`) REFERENCES `product_factory_relationship` (`Product ID`);

ALTER TABLE `Financial Figures` -- add FK Factory ID
ADD CONSTRAINT `factory_figures`
FOREIGN KEY (`Factory ID`) REFERENCES `Factory` (`Factory ID`);
