FROM quay.io/pires/docker-elasticsearch:5.6.4

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NODE_NAME elasticsearch
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV MEMORY_LOCK false

RUN /elasticsearch/bin/elasticsearch-plugin install x-pack -b
RUN /elasticsearch/bin/elasticsearch-plugin install com.floragunn:search-guard-5:5.6.4-19.1 -b

# remove ml part becasue alpine doesn't support
RUN rm -rf /elasticsearch/plugins/x-pack/platform/linux-x86_64

ADD search-guard-certificates/truststore.jks /elasticsearch/config/truststore.jks
ADD search-guard-certificates/node-certificates/CN=waiverforeverk8s.com-keystore.jks /elasticsearch/config/keystore.jks
ADD search-guard-certificates/client-certificates/CN=sgadmin-keystore.jks /elasticsearch/config/admin-keystore.jks