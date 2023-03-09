FROM nginx AS base
LABEL maintainer="John Doe"
WORKDIR /opt/www
COPY upgrade.sh /tmp/
RUN sleep 10 && echo Hello World > index.html

FROM nginx AS base2
WORKDIR /opt/www
RUN sleep 10 && echo Hello World > index2.html

FROM debian AS base3
WORKDIR /opt/www
RUN sleep 10 && echo Hello World > coverage.html

FROM nginx AS final
COPY --from=base /opt/www /usr/share/nginx/html
COPY --from=base2 /opt/www /usr/share/nginx/html