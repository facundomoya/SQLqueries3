--1 \*Traer el FirstName y LastName de Person.Person cuando el FirstName sea Mark.*\
SELECT FirstName, LastName
FROM Person.Person
WHERE (FirstName = 'Mark')

--2 \*¿Cuántas filas hay dentro de Person.Person?.*\
SELECT COUNT(*) as Filas
FROM Person.Person

--3 \*Traer las 100 primeras filas de Production.Product donde el ListPrice no es 0.*\
SELECT TOP(100) *
FROM Production.Product
WHERE (ListPrice !=0)

--4 \*Traer todas las filas de de HumanResources.vEmployee donde los apellidos de los empleados empiecen con una letra inferior a “D”.*\
SELECT LastName
FROM HumanResources.vEmployee
WHERE (LastName < 'D')

--5 \*¿Cuál es el promedio de StandardCost para cada producto donde StandardCost es mayor a $0.00? (Production.Product).*\
SELECT AVG(StandardCost) as Promedio
FROM Production.Product
WHERE (StandardCost > 0)

--6 \*En la tabla Person.Person ¿cuántas personas están asociadas con cada tipo de persona (PersonType)?.*\
SELECT PersonType, COUNT(*) Cantidad
FROM Person.Person
GROUP BY PersonType --el GROUP BY se agrega a los operadores matematicos

--7 \*Traer todas las filas y columnas de Person.StateProvince donde el CountryRegionCode sea CA.*\
SELECT * 
FROM Person.StateProvince
WHERE CountryRegionCode = 'CA'

--8 \*¿Cuántos productos en Production.Product hay que son rojos (red) y cuántos que son negros (black)?.*\
SELECT Color, COUNT(*) as Cantidad
FROM Production.Product
WHERE Color = 'Red' or Color= 'Black'
GROUP BY Color

--9 \*¿Cuál es el valor promedio de Freight por cada venta? (Sales.SalesOrderHeader) donde la venta se dio en el TerriotryID 4?.*\
SELECT AVG(Freight) as [Promedio de Freight] FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4

--10 \*Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido sea Lopez, Martin o Wood, y sus nombres empiecen con cualquier letra entre la C y la L.*\
SELECT FirstName, LastName
FROM Sales.vIndividualCustomer
WHERE (LastName = 'Lopez' or LastName = 'Martin' or LastName = 'Wood') and (FirstName>='C' and FirstName<='L')

--11 \*Devolver el FirstName y LastName de Sales.vIndividualCustomer donde el apellido sea Smith, renombra las columnas en español.*\
SELECT FirstName as [Primer nombre], LastName as Apellido
FROM Sales.vIndividualCustomer
WHERE LastName = 'Smith'

--12 \*Usando Sales.vIndividualCustomer traer a todos los clientes que tengan el CountryRegionCode de Australia ó todos los clientes que tengan un celular (Cell) y en EmailPromotion sea 0.*\
SELECT CountryRegionName,PhoneNumberType,EmailPromotion
FROM Sales.vIndividualCustomer
WHERE (CountryRegionName='Australia') or (PhoneNumberType='Cell' and EmailPromotion=1)

--13 \*¿Que tan caro es el producto más caro, por ListPrice, en la tabla Production.Product?.*\
SELECT  MAX(ListPrice) as [Precio del producto mas caro]
FROM Production.Product

--14 \*¿Cuáles son las ventas por territorio para todas las filas de Sales.SalesOrderHeader? Traer sólo los territorios que se pasen de $10 millones en ventas históricas, traer el total de las ventas y el TerritoryID.*\
SELECT TerritoryID,SUM(TotalDue) as Ventas
FROM Sales.SalesOrderHeader 
GROUP BY TerritoryID
HAVING SUM(TotalDue)>10000000

--15 \*Usando la query anterior, hacer un join hacia Sales.SalesTerritory y reemplazar el TerritoryID con el nombre del territorio.*\
SELECT SST.Name as Territorio,SUM(TotalDue) as Ventas
FROM Sales.SalesOrderHeader as SOH
LEFT JOIN Sales.SalesTerritory as SST
ON SST.TerritoryID = SOH.TerritoryID
GROUP BY SST.Name
HAVING SUM(TotalDue)>10000000

