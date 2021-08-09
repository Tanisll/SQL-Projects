print 'Hello World'

declare @maVariable int 
set @maVariable = 6

print @maVariable 

declare @var1 int, @var2 int
set @var1 = 3
set @var2 = 5

print 'Having fun with' + ' TSQL and MS SQL SERVER!'

print 'I have ' + convert(varchar(50),@var1) + ' dollars...'

print @var1 + @var2

print 'I have ' + convert(varchar(50),@var1) + char(13) + ' dollars...'

