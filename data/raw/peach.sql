USE mckinsey;

CREATE TABLE `Product`
AS
SELECT mckinsey.*, -- SELECT schema.*  select all tables from schema mckinsey
-- SELECT lv1.lv2 (schema.table or table.column BUT NEVER column.value!)
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
