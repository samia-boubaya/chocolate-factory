USE mckinsey;
CREATE TABLE `order` (
    `Order ID` CHAR(100),      -- Primary Key
    `Order Date` CHAR(100),
    `Customer ID` INT,          -- Must match wonka_choc_factory
    `Ship Date` CHAR(100),
    `Ship Mode` CHAR(100),
    PRIMARY KEY (`Order ID`),
    CONSTRAINT `order_customer_relationship` FOREIGN KEY (`Customer ID`)
        REFERENCES `wonka_choc_factory` (`Customer ID`)
);

-- create table wonka
CREATE TABLE `wonka` (
	SELECT * FROM `wonka_choc_factory`
);    

-- unique customer id 
ALTER TABLE `wonka`
ADD CONSTRAINT `unique_customer_id` UNIQUE (`Customer ID`);