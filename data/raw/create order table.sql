USE mckinsey;

CREATE TABLE `Order`
AS

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
CONSTRAINT `order_relationship` FOREIGN KEY (`Order ID`) REFERENCES `Order` (`Order ID`)
)