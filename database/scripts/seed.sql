USE [example]
GO

DECLARE @RC int
DECLARE @Name varchar(50)

SET @Name = 'Ady'

EXECUTE @RC = [dbo].[accounts_INS] 
   @Name
GO