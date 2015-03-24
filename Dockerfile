# c12e/elasticsearch
# 

FROM c12e/debian
MAINTAINER Cognitive Scale cognitivescale.com

ENV ES_VER 1.4.1

RUN wget -qO- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VER.tar.gz | tar -zxvf - -C /opt  && \
  cd /opt/elasticsearch-$ES_VER && \
  ./bin/plugin -i elasticsearch/marvel/latest && \
  ./bin/plugin --install lmenezes/elasticsearch-kopf/1.4.3 &&\
  ./bin/plugin -install royrusso/elasticsearch-HQ && \
  ./bin/plugin -install karmi/elasticsearch-paramedic && \
  ./bin/plugin -install lukas-vlcek/bigdesk/2.4.0 && \
  ./bin/plugin -install com.yakaz.elasticsearch.plugins/elasticsearch-analysis-combo/1.5.14 && \
  mkdir -p /data /logs

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 9200 9300
VOLUME ["/data", "/logs"]

CMD ["/usr/bin/supervisord"]
