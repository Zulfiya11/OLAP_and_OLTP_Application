--Retrieve the total sales amount for each product category for a specific time period:
SELECT
    pd.Category,
    SUM(sf.SalesAmount) AS TotalSalesAmount
FROM
    SalesFact sf
JOIN
    ProductDimension pd ON sf.ProductKey = pd.ProductKey
JOIN
    DateDimension dd ON sf.DateKey = dd.DateKey
WHERE
    dd.Date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    pd.Category;
	
	
	
	-- Calculate the average sales quantity by region for a particular product:
	
	SELECT
    sd.Region,
    AVG(sf.Quantity) AS AverageSalesQuantity
FROM
    SalesFact sf
JOIN
    StoreDimension sd ON sf.StoreKey = sd.StoreKey
JOIN
    ProductDimension pd ON sf.ProductKey = pd.ProductKey
WHERE
    pd.ProductName = 'Specific Product'
GROUP BY
    sd.Region;

--  Find the top five customers with the highest total sales amount:

	SELECT
    cd.CustomerName,
    SUM(sf.SalesAmount) AS TotalSalesAmount
FROM
    SalesFact sf
JOIN
    CustomerDimension cd ON sf.CustomerKey = cd.CustomerKey
GROUP BY
    cd.CustomerName
ORDER BY
    TotalSalesAmount DESC
LIMIT 5;
