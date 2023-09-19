#!/bin/bash

set -e

DATE_TIME_STRING=$(date +%F_%H_%M_%S)
BACKUP_FILE_NAME="${DATE_TIME_STRING}_ha_config_backup.tar"
BACKUP_DIR="/backups"
COMPOSE_FILE="/opt/compose.yml"

# Stop containers
docker compose -f /opt/compose.yml down

# Tar up the /opt directory
mkdir -p ${BACKUP_DIR}
pushd ${BACKUP_DIR}
tar -cf ${BACKUP_FILE_NAME} /opt/*
popd

# Start containers
docker compose -f /opt/compose.yml up -d
