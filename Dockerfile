FROM quay.io/pires/docker-elasticsearch:5.2.2_1

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NODE_NAME elasticsearch
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

RUN /elasticsearch/bin/elasticsearch-plugin install x-pack -b
RUN /elasticsearch/bin/elasticsearch-plugin install com.floragunn:search-guard-5:5.2.2-11 -b

ADD search-guard-certificates/truststore.jks /elasticsearch/config/truststore.jks
ADD search-guard-certificates/node-certificates/CN=waiverforeverk8s.com-keystore.jks /elasticsearch/config/keystore.jks