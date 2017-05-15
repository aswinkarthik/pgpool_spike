#!/bin/bash

set -e
set -E 

###############
## On Master ##
###############


export MASTER_DB=10.0.0.100
export SLAVE_DB=10.0.0.101
export PGDATA=/var/lib/pgsql/9.5/data
export FAILOVER_DIR=/var/lib/pgsql/failover
export WAL_ARCHIVE_DIR=/var/lib/pgsql/9.5/wal_archives
export PORT=5432

## Add postgres user to sudoers file on both machines

## Initdb postgres on Master
/etc/init.d/postgresql-9.5 initdb


## Configure postgres on Master
## Current configuration uses archive command, maybe replace it with replication slots if needed
vim $PGDATA/postgresql.conf

## Create necessary dirs

mkdir -p $FAILOVER_DIR
mkdir -p $WAL_ARCHIVE_DIR

## Start postgres

sudo /etc/init.d/postgresql-9.5 start

## Replication steps
## Edit pg_hba.conf for appropriate values

## Create admin and replication role

sudo su - postgres 
psql -c "CREATE ROLE admin WITH LOGIN SUPERUSER PASSWORD 'Mypassword'"
psql -c "CREATE ROLE replication WITH LOGIN REPLICATION PASSWORD 'replication'"



## After Streaming is done on slave
## To check if streaming is working

psql -c 'select * from pg_stat_replication' 

## Setup passwordless SSH as well by coping pub keys to auth keys
ssh-keygen -b 1024 -t rsa
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
