#!/bin/bash
#
CLUSTER_NAME=${ELASTICSEARCH_CLUSTER_NAME:-elasticsearch}

[[ -d /data/elasticsearch ]] || mkdir -p /data/elasticsearch
cd /opt/elasticsearch-${ES_VER}
./bin/elasticsearch --path.data /data/elasticsearch --cluster.name=$CLUSTER_NAME | tee /logs/elasticsearch.log
