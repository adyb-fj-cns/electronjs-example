-- Database
USE master
GO

IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = 'example'
)
CREATE DATABASE example

GO