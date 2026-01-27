SELECT * 
FROM Person.Person
WHERE BusinessEntityID = @BusinessEntityID;

use AdventureWorks2025
select top 15 * from [Person].[Person];
select top 15 * from [Person].[Person] order by BusinessEntityID desc;

select top 15 BusinessEntityID, LastName from [Person].[Person]
UNION ALL
SELECT TOP 15 BusinessEntityID, LastName from [Person].[Person] order by BusinessEntityID desc;