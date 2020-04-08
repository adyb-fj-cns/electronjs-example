CREATE TABLE [dbo].[task](
[id] [int] NOT NULL IDENTITY(1,1),
[name] [varchar](50) NULL
)
GO

CREATE PROCEDURE [dbo].[task_INS]
@Name [varchar](50)
AS 
    INSERT INTO [example].[dbo].[task] WITH(ROWLOCK) ([Name]) 
    VALUES (@Name)

GO

CREATE PROCEDURE [dbo].[task_FET]
@Name [varchar](50)
AS 
    SELECT * FROM [example].[dbo].[task] WITH(ROWLOCK) 
    WHERE ([Name] = @Name)

GO