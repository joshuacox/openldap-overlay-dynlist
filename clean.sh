#!/bin/bash
set -eux
docker compose down
sudo rm -Rf data/*
sudo chmod 777 data
