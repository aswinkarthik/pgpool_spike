#!/bin/bash

set -e
set -E 

###############
## On Slave  ##
###############


export MASTER_DB=10.0.0.100
export SLAVE_DB=10.0.0.101
export PGDATA=/var/lib/pgsql/9.5/data
export FAILOVER_DIR=/var/lib/pgsql/failover
export WAL_ARCHIVE_DIR=/var/lib/pgsql/9.5/wal_archives
export PORT=5432


## Clear pddata on standby
rm -rf $PGDATA/*

## Clone PGDATA from master
pg_basebackup  -h $MASTER_DB -D $PGDATA -P -U replication --xlog-method=stream

## Create necessary dirs

mkdir -p $FAILOVER_DIR
mkdir -p $WAL_ARCHIVE_DIR

## Start postgres

sudo /etc/init.d/postgresql-9.5 start

## Setup passwordless SSH as well by coping pub keys to auth keys
ssh-keygen -b 1024 -t rsa
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
