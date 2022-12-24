#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
CONNECTION_STRING="$(jq --raw-output '.connectionString' $CONFIG_PATH)"

echo Hello!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16
sudo cp -R $NVM_DIR/versions/node/$(nvm version)/* /usr/local/
cd /app
node -v
npm -v

npm install --no-audit --no-fund --no-update-notifier --omit=dev --unsafe-perm 
sleep 99999
#node server.js
#forever start --workingDir /app -a -o /dev/null -e /nodejs.err.log --killSignal=SIGTERM /app/server.js