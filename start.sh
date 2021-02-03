RUN_TYPE="$1"
start=$(tput setaf 3)
end=$(tput sgr0)

HOSTS_DIR=$(pwd)/docker/nginxServer/config/hosts
EN_DIR=$(pwd)/docker/nginxServer/config/sites-enabled
AV_DIR=$(pwd)/docker/nginxServer/config/sites-available
LOGS_DIR=$(pwd)/docker/nginxServer/logs

if [ "$RUN_TYPE" = "prod" ]; then
    echo "${start}BUILDING AND RUNNITNG CONTAINERS FOR PRODUCTION${end}"
    docker-compose up -d --build
elif [ "$RUN_TYPE" = "dev" ]; then
    echo "${start}BUILDING AND RUNNITNG CONTAINERS FOR DEVELOPMENT${end}"
    docker-compose up -d --build nginx
    docker-compose up -d --build redis
    docker-compose up -d --build mongo
    docker-compose run --rm -e MODE=development --service-ports node
elif [ "$RUN_TYPE" = "dev-host" ]; then
    rm -rf $EN_DIR && rm -rf $AV_DIR && rm -rf $LOGS_DIR
    mkdir $EN_DIR && mkdir $AV_DIR && mkdir $LOGS_DIR
    cp $HOSTS_DIR/dev.loc.conf $AV_DIR/dev.loc.conf
    ln -s $AV_DIR/dev.loc.conf $EN_DIR/dev.loc.conf
elif [ "$TYPE" = "clear" ]; then
    echo 'CLEAR SCRIPT IS NOT EXISTS'
else
    echo 'ENTER COMMAND sh start.sh prod | dev for run containers'
    echo 'ENTER COMMAND dev-host for generate example host to nginx container'
fi
