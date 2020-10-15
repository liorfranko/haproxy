FROM debian
RUN apt-get update
RUN apt-get install -y curl haproxy procps
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
CMD haproxy  -f /usr/local/etc/haproxy/haproxy.cfg