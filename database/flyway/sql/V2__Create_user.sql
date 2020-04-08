CREATE TABLE [dbo].[user](
[id] [int] NOT NULL IDENTITY(1,1),
[name] [varchar](50) NULL
)
GO

CREATE PROCEDURE [dbo].[user_INS]
@Name [varchar](50)
AS 
    INSERT INTO [example].[dbo].[user] WITH(ROWLOCK) ([Name]) 
    VALUES (@Name)

GO

CREATE PROCEDURE [dbo].[user_FET]
@Name [varchar](50)
AS 
    SELECT * FROM [example].[dbo].[user] WITH(ROWLOCK) 
    WHERE ([Name] = @Name)

GO