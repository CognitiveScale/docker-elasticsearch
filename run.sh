#!/bin/bash
#

[[ -d /data/elasticsearch ]] || mkdir -p /data/elasticsearch
cd /opt/elasticsearch-${ES_VER}
./bin/elasticsearch --path.data /data/elasticsearch | tee /logs/elasticsearch.log
