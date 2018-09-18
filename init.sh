#!/bin/bash

set -e

docker-compose up -d node-cluster-1
sleep 5
export NODE1_CLUSTER_ID="$(cat volumes/node1/cluster/service.json | jq -jcre '.cluster.id')"
export NODE1_CLUSTER_MULTIADDRESS="/dns4/node-cluster-1/tcp/9096/ipfs/${NODE1_CLUSTER_ID}"
docker-compose up -d
docker-compose logs -f

# docker-compose run client -c "ipfs --api /ip4/192.168.144.3/tcp/9095 pin ls"
