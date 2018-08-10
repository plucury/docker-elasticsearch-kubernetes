FROM quay.io/pires/docker-elasticsearch:6.3.2

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NODE_NAME elasticsearch
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV MEMORY_LOCK false

# Create a temporary folder for Elastic Search ourselves.
ENV ES_TMPDIR /tmp

# remove ml part becasue alpine doesn't support
RUN rm -rf /elasticsearch/plugins/x-pack/platform/linux-x86_64
RUN rm -rf /elasticsearch/plugins/x-pack/x-pack-ml/platform/linux-x86_64

RUN /elasticsearch/bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.3.2-22.3

RUN chmod +x -R plugins/search-guard-6/tools/*.sh

ADD search-guard-certificates/truststore.jks /elasticsearch/config/truststore.jks
ADD search-guard-certificates/node-certificates/CN=waiverforeverk8s.com-keystore.jks /elasticsearch/config/keystore.jks
ADD search-guard-certificates/client-certificates/CN=sgadmin-keystore.jks /elasticsearch/config/admin-keystore.jks

