#!/bin/sh

mkdir -p ~/.pgsql/pgdir
pg_ctl initdb -D ~/.pgsql/pgdir -o "-A trust -E UTF8 --locale en_US -U postgres"
pg_ctl start -D ~/.pgsql/pgdir

createuser -U postgres test
createdb -U postgres -O test test
