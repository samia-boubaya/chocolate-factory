-- =========================================================
-- USE DATABASE
-- =========================================================
USE mckinsey;

-- =========================================================
-- DROP TABLES IF THEY EXIST (SAFE RESET)
-- =========================================================
DROP TABLE IF EXISTS financial_figures;
DROP TABLE IF EXISTS orders;

-- =========================================================
-- CREATE ORDERS TABLE
-- =========================================================
CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  ship_date DATE,
  ship_mode TEXT,
  PRIMARY KEY (order_id)
);

-- =========================================================
-- INSERT DATA INTO ORDERS
-- =========================================================
INSERT INTO orders (customer_id, order_date, ship_date, ship_mode)
SELECT
  `Customer ID`,
  STR_TO_DATE(`Order Date`, '%Y-%m-%d'),
  STR_TO_DATE(`Ship Date`, '%Y-%m-%d'),
  `Ship Mode`
FROM wonka_choc_factory
GROUP BY
  `Customer ID`,
  `Order Date`,
  `Ship Date`,
  `Ship Mode`;

-- =========================================================
-- CREATE FINANCIAL FIGURES TABLE
-- =========================================================
CREATE TABLE financial_figures (
  financial_figure_id INT NOT NULL AUTO_INCREMENT,
  units INT,
  sales DECIMAL(10,2),
  cost DECIMAL(10,2),
  gross_profit DECIMAL(10,2),
  order_id INT,
  product_id CHAR(100),
  factory_id CHAR(100),
  PRIMARY KEY (financial_figure_id)
);

-- =========================================================
-- INSERT DATA INTO FINANCIAL FIGURES
-- =========================================================
INSERT INTO financial_figures (
  units,
  sales,
  cost,
  gross_profit,
  order_id,
  product_id,
  factory_id
)
SELECT
  `Units`,
  `Sales`,
  `Cost`,
  (`Sales` - `Cost`) AS gross_profit,
  o.order_id,
  `Product ID`,
  `Factory ID`
FROM wonka_choc_factory w
JOIN orders o
  ON w.`Customer ID` = o.customer_id
 AND STR_TO_DATE(w.`Order Date`, '%Y-%m-%d') = o.order_date;

-- =========================================================
-- ADD FOREIGN KEY CONSTRAINTS
-- =========================================================
ALTER TABLE financial_figures
ADD CONSTRAINT fk_financial_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE financial_figures
ADD CONSTRAINT fk_financial_product
FOREIGN KEY (product_id) REFERENCES Product(product_id);

ALTER TABLE financial_figures
ADD CONSTRAINT fk_financial_factory
FOREIGN KEY (factory_id) REFERENCES Factory(factory_id);

-- =========================================================
-- VERIFY DATA
-- =========================================================
SELECT * FROM orders LIMIT 10;
SELECT * FROM financial_figures LIMIT 10;
