#/bin/sh

make test
node_modules/@pact-foundation/pact-node/standalone/linux-x64-1.82.3/pact/bin/pact-broker \
  publish /home/example-consumer/pacts --consumer-app-version 1234 --tag master