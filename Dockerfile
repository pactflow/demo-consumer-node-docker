FROM pactfoundation/pact-cli:0.16.3.2-node14

RUN apk add --no-cache --virtual build-dependencies build-base

RUN  apk --no-cache add ca-certificates wget bash \
  && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
  && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
  && apk add glibc-2.29-r0.apk

ADD package.json package-lock.json /home/example-consumer/
ADD src /home/example-consumer/src
ADD public /home/example-consumer/public
ADD pactflow /home/example-consumer/pactflow
ADD entrypoint.sh /root/entrypoint.sh

WORKDIR /home/example-consumer

RUN npm install
RUN chmod 775 /home/example-consumer

ENV REACT_APP_API_BASE_URL=http://localhost:8080
ENTRYPOINT /root/entrypoint.sh
