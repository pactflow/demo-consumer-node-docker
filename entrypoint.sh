#/bin/sh
set -e
cd /home/example-consumer
npm run test
pact publish /home/example-consumer/pacts --consumer-app-version fake-git-sha-for-demo-$(date +%s) --tag master
