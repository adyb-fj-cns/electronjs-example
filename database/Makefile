all: drop create migrate seed query

drop: 
	docker cp ./scripts/drop.sql mssql:/drop.sql
	docker exec -it mssql /opt/mssql-tools/bin/sqlcmd \
		-S localhost \
		-U SA \
		-P 'Passw0rd' \
		-i /drop.sql

create:
	docker cp ./scripts/create.sql mssql:/create.sql
	docker exec -it mssql /opt/mssql-tools/bin/sqlcmd \
		-S localhost \
		-U SA \
		-P 'Passw0rd' \
		-i /create.sql

build-migration:
	docker build -t migration -f $$PWD/flyway/Dockerfile ./flyway

migrate:
	docker run --rm --net=host migration

# Flyway
migrate-no-build:
	docker run --rm --net=host \
		-v $$PWD/flyway/sql:/flyway/sql \
		-v $$PWD/flyway/conf:/flyway/conf \
		flyway/flyway \
		migrate


query:
	docker cp ./scripts/query.sql mssql:/query.sql
	docker exec -it mssql /opt/mssql-tools/bin/sqlcmd \
		-S localhost \
		-U SA \
		-P 'Passw0rd' \
		-i /query.sql

seed:
	docker cp ./scripts/seed.sql mssql:/seed.sql
	docker exec -it mssql /opt/mssql-tools/bin/sqlcmd \
		-S localhost \
		-U SA \
		-P 'Passw0rd' \
		-i /seed.sql

# Requires the samuelmarks/mssql-server-fts-sqlpackage-linux image for creating bacpac files
#export:
#	docker exec -it mssql \
# 		dotnet /opt/sqlpackage/sqlpackage.dll 
#		/a:Export 
#		/ssn:localhost 
#		/sdn:example 
#		/su:SA 
#		/sp:Passw0rd 
#		/tf:example.bacpac



