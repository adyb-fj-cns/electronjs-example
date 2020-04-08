-- Database
USE master
GO

IF EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = 'example'
)
ALTER DATABASE example SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE example

GO

