if [ "$MODE" = "development" ]; then
    ssh -fN -L $DATABASE_PORT:localhost:$MONGO_REMOTE_SSH_PORT root@$MONGO_REMOTE_SSH_IP
    yarn run start:dev
else
    pm2-runtime start ecosystem.config.js
fi
