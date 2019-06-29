#!/bin/bash

# source $(readlink -f $(dirname $0))/.env

export DEBUG=1
export GOLANG_DOCKERHUB_TAG=1.10-stretch
export AWS_REGION=us-west-2

#export TEST_MONGODB_FLAVOR=percona/percona-server-mongodb
export TEST_MONGODB_FLAVOR=mongo
export TEST_PSMDB_VERSION=4.0
export TEST_MONGODB_ADMIN_USERNAME=admin
export TEST_MONGODB_ADMIN_PASSWORD=admin123456
export TEST_MONGODB_USERNAME=test
export TEST_MONGODB_PASSWORD=123456

export TEST_MONGODB_STANDALONE_PORT=27017

export TEST_MONGODB_MONGOS_PORT=17000

export TEST_MONGODB_S1_RS=rs1
export TEST_MONGODB_S1_PRIMARY_PORT=17001
export TEST_MONGODB_S1_SECONDARY1_PORT=17002
export TEST_MONGODB_S1_SECONDARY2_PORT=17003

export TEST_MONGODB_S2_RS=rs2
export TEST_MONGODB_S2_PRIMARY_PORT=17004
export TEST_MONGODB_S2_SECONDARY1_PORT=17005
export TEST_MONGODB_S2_SECONDARY2_PORT=17006

export TEST_MONGODB_CONFIGSVR_RS=csReplSet
export TEST_MONGODB_CONFIGSVR1_PORT=17007
export TEST_MONGODB_CONFIGSVR2_PORT=17008
export TEST_MONGODB_CONFIGSVR3_PORT=17009

export TEST_MONGODB_S3_RS=rs3
export TEST_MONGODB_S3_PRIMARY_PORT=17021
export TEST_MONGODB_S3_SECONDARY1_PORT=17022
export TEST_MONGODB_S3_SECONDARY2_PORT=17023

export MINIO_ENDPOINT=http://localhost:9000/
export MINIO_ACCESS_KEY_ID=example00000
export MINIO_SECRET_ACCESS_KEY=secret00000
