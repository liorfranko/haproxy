FROM debian
RUN apt-get update
RUN apt-get install -y curl haproxy procps supervisor vim dnsutils tcpdump rsyslog wget gnupg2 apt-transport-https net-tools kafkacat
COPY consul-template /opt/consul/consul-template 
RUN mkdir -p /opt/supervisor
RUN mkdir -p /config
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install filebeat -y 
ADD supervisor.conf /opt/supervisor/
COPY 49-haproxy.conf /etc/rsyslog.d/49-haproxy.conf
COPY haproxy.yml /etc/filebeat/modules.d/haproxy.yml
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf
CMD ["supervisord", "--nodaemon", "--configuration", "/opt/supervisor/supervisor.conf"]