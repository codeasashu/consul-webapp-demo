FROM php:fpm-alpine

RUN docker-php-ext-install pdo_mysql

# setting a default value to make it work on dockerhub
ARG     CONSUL_TEMPLATE_VERSION=0.18.1
ENV     CONSUL_URL consul:8500


ADD     https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /usr/bin/
RUN     unzip /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
        mv consul-template /usr/local/bin/consul-template && \
        rm -rf /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip

COPY start.sh /tmp

RUN ["chmod", "+x", "/tmp/start.sh"]

VOLUME  templates

EXPOSE 9000
CMD ["php-fpm"]

