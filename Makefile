postgres:
	docker run --name postgres -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres dropdb --username=root simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb
# This Makefile is used to manage the PostgreSQL database for the simple_bank application.
# It provides commands to start a PostgreSQL container, create a database, and drop the database.
# The commands use Docker to run the PostgreSQL container and execute the necessary commands inside it.
# The database is named simple_bank and is owned by the user root.
# The PostgreSQL container is started with the user root and password secret.
# The database is created with the same user and owner.
# The database is exposed on port 5432.