#!/bin/sh
set -e
docker build . -t pactflow/demo-consumer-node
docker run --rm -e PACT_BROKER_BASE_URL -e PACT_BROKER_TOKEN pactflow/demo-consumer-node
# docker run --rm -e PACT_BROKER_BASE_URL -e PACT_BROKER_TOKEN -it --entrypoint sh pactflow/demo-consumer-node
