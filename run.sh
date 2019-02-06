#!/bin/bash

clean_port(){
    PORT=$1
    echo "cleaning port $PORT ...."
    PORT_USE=$(sudo fuser -n tcp $PORT)
    while [[ ! -z "$PORT_USE" ]]
    do
        PORT_USE=$(sudo fuser -n tcp -k $PORT)
        echo "port_use: $PORT_USE"
    done
    echo "port $PORT is clean"
}

clean_ports(){
    for i in 3306 8181 8080
        do
            clean_port $i
        done
}

test() {
    echo "ya it works"
}

up() {
    echo "installing npm...."
#    cd ./frontend/ &&
 #    npm install &&
    cd ./deploy &&
    clean_ports
    echo "starting docker....."
#    docker-compose build &&
    docker-compose up &&
    sleep 5 &&
    docker-compose exec backend php artisan migrate

#    docker-compose exec backend bash
#    docker-compose exec backend php artisan migrate -v
}

down(){
cd ./deploy/
    docker-compose down
}
case $@ in
    test) test
    ;;
    up) up
    ;;
    down) down
    ;;
    *) echo "auch! cannot resolve '$@' :("
    ;;
esac

