USE mckinsey -- USE schema_name
CREATE TABLE  `Financial Figures`(
`Financial Figures ID` char(50),  -- primary key
`Order ID` char(50), -- foreign key from Order
`Product ID` char(50), -- foreign key from Product
`Factory ID` char(50), -- foreign key from Factory
`Units` int, 
`Sales` float,
`Cost` float,
`Gross Profit` float,

PRIMARY KEY (`Financial Figures ID`),
CONSTRAINT `order_relationship` FOREIGN KEY (`Order ID`) REFERENCES `Order` (`Order ID`),
CONSTRAINT `product_relationship` FOREIGN KEY (`Product ID`) REFERENCES `Product` (`Product ID`),
CONSTRAINT `factory_relationship` FOREIGN KEY (`Factory ID`) REFERENCES `Factory` (`Factory ID`)
)

