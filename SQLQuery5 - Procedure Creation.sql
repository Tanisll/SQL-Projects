use AdventureWorks2017
go
create procedure dbo.uspGetAddress
as select * from Person.Address
go
exec dbo.uspGetAddress