USE [example]
GO

SELECT * from [dbo].[accounts]

GO

DECLARE @RC int
DECLARE @Name varchar(50)

SET @Name = 'Ady'

EXECUTE @RC = [dbo].[accounts_FET] 
   @Name
GO