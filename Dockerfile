FROM node:14.13.1-alpine3.10

RUN apk add --no-cache --virtual build-dependencies build-base

RUN  apk --no-cache add ca-certificates wget bash \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
  && apk add glibc-2.29-r0.apk

ADD https://github.com/pactflow/example-consumer/archive/master.zip /home/example-consumer.zip
RUN cd /home \
      && unzip example-consumer.zip \
      && mv example-consumer-master example-consumer \
      && rm -rf example-consumer.zip \
      && cd example-consumer \
      && npm i \
      && chmod 775 /home/example-consumer

WORKDIR /home/example-consumer
ENV REACT_APP_API_BASE_URL=http://localhost:8080
ENV CI=true
ADD entrypoint.sh /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
