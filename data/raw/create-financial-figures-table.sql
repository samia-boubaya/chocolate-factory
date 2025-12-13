-- list all the columns
-- column_name column_type,
-- column_name column_type,
-- column_name column_type
-- --------------------------------------




USE mckinsey -- USE schema_name
-- from wonka_choc_factory table 
CREATE TABLE  `Financial Figures`(
`Financial Figures ID` char(50),  -- primary key
`Order ID` char(50), -- foreign key from Order
`Product ID` char(50), -- foreign key from Product
`Factory ID` char(50), -- foreign key from Factory
wonka_cho_factory.`Units` AS `Units` int , 
`Sales` float,
`Cost` float,
`Gross Profit` float,

PRIMARY KEY (`Financial Figures ID`),
CONSTRAINT `order_relationship` FOREIGN KEY (`Order ID`) REFERENCES `Order` (`Order ID`),
CONSTRAINT `product_relationship` FOREIGN KEY (`Product ID`) REFERENCES `Product` (`Product ID`),
CONSTRAINT `factory_relationship` FOREIGN KEY (`Factory ID`) REFERENCES `Factory` (`Factory ID`)
)





-- list all the columns
-- column_name column_type,
-- column_name column_type,
-- column_name column_type
-- --------------------------------------




USE mckinsey -- USE schema_name
CREATE TABLE  `Financial Figures`(
`Financial Figures ID` char(50),  -- primary key
`Order ID` char(50), -- foreign key from Order
`Product ID` char(50), -- foreign key from Product
`Factory ID` char(50), -- foreign key from Factory
`Units` int, 
`Sales` float,
`Cost` float,
`Gross Profit` float

PRIMARY KEY (`Financial Figures ID`),
CONSTRAINT `order_relationship` FOREIGN KEY (`Order ID`) REFERENCES `Order` (`Order ID`),
CONSTRAINT `product_relationship` FOREIGN KEY (`Product ID`) REFERENCES `Product` (`Product ID`),
CONSTRAINT `factory_relationship` FOREIGN KEY (`Factory ID`) REFERENCES `Factory` (`Factory ID`),
)


