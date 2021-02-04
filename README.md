## Start for development

- `git clone https://github.com/axenov-it/node-framework.git`
- `copy docker-compose.example.yml to docker-compose.yml`
- `copy .env.example to .env`
- `run command: sh start.sh dev`
- `servise running on localhost:9005`
- `swagger servise running on localhost:9005/swagger`
- `execute query localhost:9005/posts/generate for generate mock data in mongo db container`
- `execute query localhost:9005/posts for demonstration mvc work`
- `for enable readis change in file /docker/nginxServer/config/cache.status.conf ENABLE_REDIS_CACHE=on and reload nginx`

## Nginx configuration

- `For generate local host example run command: sh start.sh dev-host`
- `Open local file /etc/hosts and add row 127.0.0.1 dev.loc`
