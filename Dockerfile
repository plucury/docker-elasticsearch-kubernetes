FROM quay.io/pires/docker-elasticsearch:5.2.2_1

MAINTAINER pjpires@gmail.com

RUN /elasticsearch/bin/elasticsearch-plugin install x-pack -b

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
