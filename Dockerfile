FROM debian AS base
LABEL maintainer="John Doe"
WORKDIR /opt/www
RUN sleep 10 && echo Hello World > index.html

FROM debian AS base2
WORKDIR /opt/www
RUN sleep 10 && echo Hello World > index2.html

FROM debian AS base3
WORKDIR /opt/www
RUN sleep 10 && echo Hello World > index3.html

FROM nginx AS final
COPY --from=base /opt/www /usr/share/nginx/html
COPY --from=base2 /opt/www /usr/share/nginx/html