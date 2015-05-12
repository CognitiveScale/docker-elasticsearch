# c12e/elasticsearch

FROM c12e/debian
MAINTAINER CognitiveScale.com
ENV SERVICE_NAME=elasticsearch

ADD supervisor.conf /etc/supervisor/conf.d/${SERVICE_NAME}.conf

ENV ES_VER 1.4.1

RUN wget -qO- https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VER.tar.gz | tar -zxvf - -C /opt  && \
  cd /opt/elasticsearch-$ES_VER && \
  #./bin/plugin --install elasticsearch/marvel/latest && \
  ./bin/plugin --install lmenezes/elasticsearch-kopf/1.4.3 &&\
  #./bin/plugin --install royrusso/elasticsearch-HQ && \
  #./bin/plugin --install karmi/elasticsearch-paramedic && \
  #./bin/plugin --install lukas-vlcek/bigdesk && \
  ./bin/plugin --install com.yakaz.elasticsearch.plugins/elasticsearch-analysis-combo/1.5.1 && \
  mkdir -p /data /logs

ADD run.sh /
EXPOSE 9200 9300

# Default command when starting the container
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
