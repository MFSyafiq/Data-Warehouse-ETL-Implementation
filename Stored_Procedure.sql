CREATE OR ALTER PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		a.OrderID,
		d.CustomerName,
		b.ProductName,
		a.Quantity,
		c.StatusOrder
	FROM
		FactSalesOrder a
	INNER JOIN DimProduct b on a.ProductID = b.ProductID
	INNER JOIN DimOrderStatus c on a.StatusID = c.StatusID
	INNER JOIN DimCostumer d on a.CustomerID = d.CustomerID
	WHERE c.StatusID = @StatusID
END

EXEC summary_order_status @StatusID = 4