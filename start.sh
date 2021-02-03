TYPE="$1"
start=$(tput setaf 3)
end=$(tput sgr0)

if [ "$TYPE" = "prod" ]; then
    echo "${start}BUILDING AND RUNNITNG CONTAINERS FOR PRODUCTION${end}"
    docker-compose up -d --build
elif [ "$TYPE" = "dev" ]; then
    echo "${start}BUILDING AND RUNNITNG CONTAINERS FOR DEVELOPMENT${end}"
    docker-compose up -d --build nginx
    docker-compose up -d --build redis
    docker-compose up -d --build mongo
    docker-compose run --rm --service-ports node
elif [ "$TYPE" = "clear" ]; then
    echo 'CLEAR SCRIPT IS NOT EXISTS'
else
    echo 'ENTER COMMAND sh start.sh prod | dev | clear'
fi
