#!/bin/bash

set -e
set -E 

##################
## On All Nodes ##
##################


yum install -y vim

## Centos 6, pgPool-II yum repo
yum install -y http://www.pgpool.net/yum/rpms/3.6/redhat/rhel-6-x86_64/pgpool-II-release-3.6-1.noarch.rpm
## Centos 6, pgPool-II bin
yum install -y pgpool-II-pg95.x86_64

yum install -y http://yum.postgresql.org/9.5/redhat/rhel-6-x86_64/pgdg-redhat95-9.5-2.noarch.rpm

yum install -y postgresql95-server postgresql95
