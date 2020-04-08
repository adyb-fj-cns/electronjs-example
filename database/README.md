# Database

* https://hub.docker.com/_/microsoft-mssql-server
* https://docs.microsoft.com/en-us/sql/ssms/scripting/sqlcmd-use-the-utility?view=sql-server-ver15
* https://github.com/flyway/flyway-docker
* https://github.com/Microsoft/azuredatastudio

View the `Makefile` to observer how this is running.

Essentially flyway is used to create the database migrations. These migrations are packed into an image which currently expects the database to be accessible via localhost:1433.