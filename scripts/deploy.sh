#!/bin/bash

cd /var/www/my-react-app

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 20.19.0

npm install
npm run build

pm2 restart my-react-app || pm2 start $(which serve) --name my-react-app -- -s build -l 3000

pm2 save
