--Valishev Albert

--ex1
SELECT e.FirstName, e.LastName FROM DimEmployee e WHERE (e.DepartmentName='Marketing' 
OR e.DepartmentName='Information Service') 
AND e.StartDate>CAST('2007-09-01' AS DATE)
AND e.Gender='M'

--ex2
SELECT dp.EnglishProductName FROM DimCustomer dc, FactInternetSales fi, DimGeography dg, DimProduct dp  WHERE dp.ProductKey=fi.ProductKey AND dc.CustomerKey=fi.CustomerKey 
AND dc.GeographyKey=dg.GeographyKey AND fi.OrderDate>=CAST('2007-06-01' AS DATE) AND fi.OrderDate<=CAST('2007-08-31' AS DATE) 
AND dg.EnglishCountryRegionName='Kanada';

--ex3
SELECT * FROM(
SELECT dps.EnglishProductSubcategoryName, COUNT(dps.EnglishProductSubcategoryName) ct FROM(FactInternetSales fi 
JOIN DimProduct dp ON fi.ProductKey = dp.ProductKey  
JOIN DimProductSubcategory dps ON  dp.ProductSubcategoryKey=dps.ProductSubcategoryKey)
GROUP BY dps.EnglishProductSubcategoryName) m ORDER BY -ct
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY

--ex4(clone 3)
SELECT * FROM(
SELECT dps.EnglishProductSubcategoryName, COUNT(dps.EnglishProductSubcategoryName) ct FROM(FactInternetSales fi 
JOIN DimProduct dp ON fi.ProductKey = dp.ProductKey  
JOIN DimProductSubcategory dps ON  dp.ProductSubcategoryKey=dps.ProductSubcategoryKey)
GROUP BY dps.EnglishProductSubcategoryName ) m ORDER BY -ct
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY

--ex5
SELECT * FROM( FactInternetSales fi JOIN DimProduct dp ON fi.ProductKey=dp.ProductKey JOIN 