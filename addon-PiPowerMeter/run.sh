#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONNECTION_STRING="$(jq --raw-output '.connectionString' $CONFIG_PATH)"

echo Hello!
cd /app
node -v
npm -v
npm install
#node server.js
#forever start --workingDir /app -a -o /dev/null -e /nodejs.err.log --killSignal=SIGTERM /app/server.js