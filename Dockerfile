FROM debian
RUN apt-get update
RUN apt-get install -y curl haproxy procps supervisor vim dnsutils
COPY consul-template /opt/consul/consul-template 
RUN mkdir -p /opt/supervisor
RUN mkdir -p /config
ADD supervisor.conf /opt/supervisor/
CMD ["supervisord", "--nodaemon", "--configuration", "/opt/supervisor/supervisor.conf"]