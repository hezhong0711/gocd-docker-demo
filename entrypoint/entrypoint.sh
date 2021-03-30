#!/bin/bash

chown go /var/run/docker.sock

bash /docker-entrypoint.sh
