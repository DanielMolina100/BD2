----Parcial 1 BD2

--Jos� Daniel Molina Galindo --- 1007420

/*Por temas de manejo de costos, no debe permitir cambiar el precio de lista de un producto, 
si existen ordenes de venta en proceso ( no finalizadas ) y su �ltimo cambio de precio no haya pasado 1 a�o.*/

Select*From Production.Product
Select*From Production.ProductCostHistory
Select*From Sales.SalesOrderDetail

CREATE TRIGGER historialP1 ON Production.ProductCostHistory INSTEAD OF INSERT AS
BEGIN 

--Declaramos las variables necesarias para el proceso de los productos en la tabla

DECLARE @FechaActual datetime
SET @FechaActual = GETDATE()
DECLARE @ProductID int
DECLARE @StandardCost money
DECLARE @NPrecio money
DECLARE @ModifiedDate datetime
DECLARE @finalizada date


---Seleccionar los nuevos datos de la variable que esta en proceso de cambios
SELECT  @NPrecio = StandardCost
from inserted;

Select @ProductID = ProductID, @StandardCost = StandardCost, @ModifiedDate = ModifiedDate
From Production.ProductCostHistory
group by ProductID, StandardCost, ModifiedDate

--Si existen ordenes de ventas (no finalizadas) Listado de las ordenes COMPLETAS :) PROBAR PORFIS
select*from Production.ProductCostHistory select personas.FirstName as total_vendido, year(QuotaDate) as a�o from Sales.SalesPersonQuotaHistory ventasGT
inner join Person.Person personas on ventasGT.BusinessEntityID = personas.BusinessEntityID group by personas.BusinessEntityID, year(QuotaDate), personas.FirstName 
order by personas.BusinessEntityID;

---Que el ultimo cambio de precio no haya pasado un a�o
IF(DATEDIFF(MONTH, @ModifiedDate, @FechaActual) <= 12)
BEGIN 
			
UPDATE Production.Product
SET StandardCost = StandardCost
WHERE ProductID = @ProductID
PRINT 'Se cambi� el costo con �xito'
END
ELSE
BEGIN
PRINT 'Error al insertar el nuevo costo'
END
END 





