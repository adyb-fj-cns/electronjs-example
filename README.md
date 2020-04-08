# Electron JS Example App

This is a basic example app showing different approaches in packaging up a web application

.NET Core WebAPI 

* https://docs.microsoft.com/en-gb/aspnet/core/tutorials/first-web-api?view=aspnetcore-3.0&tabs=visual-studio-code

```
dotnet new webapi -o api
cd api
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.InMemory


dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet tool install --global dotnet-aspnet-codegenerator
dotnet aspnet-codegenerator controller -name AccountItemsController -async -api -m AccountItem -dc AccountContext -outDir Controllers
```