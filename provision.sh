#!/bin/bash

set -e
set -E 


## Centos 6, pgPool-II yum repo
yum install http://www.pgpool.net/yum/rpms/3.6/redhat/rhel-6-x86_64/pgpool-II-release-3.6-1.noarch.rpm
## Centos 6, pgPool-II bin
yum install pgpool-II-pg95.x86_64