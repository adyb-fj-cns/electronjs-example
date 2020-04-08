CREATE TABLE [dbo].[accounts](
[id] [int] NOT NULL IDENTITY(1,1),
[name] [varchar](50) NULL
)
GO

CREATE PROCEDURE [dbo].[accounts_INS]
@Name [varchar](50)
AS 
    INSERT INTO [example].[dbo].[accounts] WITH(ROWLOCK) ([Name]) 
    VALUES (@Name)

GO

CREATE PROCEDURE [dbo].[accounts_FET]
@Name [varchar](50)
AS 
    SELECT * FROM [example].[dbo].[accounts] WITH(ROWLOCK) 
    WHERE ([Name] = @Name)

GO