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
print_docker(){
cat << "EOF"
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""\___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
         \    \        __/
          \____\______/

          |          |
       __ |  __   __ | _  __   _
      /  \| /  \ /   |/  / _\ |
      \__/| \__/ \__ |\_ \__  |
EOF
}
up() {
    cd ./backend &&
    composer install &&
    cd ../deploy &&
    clean_ports
    echo "starting docker....."
    docker-compose build &&
    docker-compose up -d &&
    echo ""
    print_docker
    echo ""
    echo "your app is waiting for you at localhost:8080"
    echo ""
    echo ""
}

up_mac(){
    cd ./deploy &&
    echo "starting docker....."
    docker-compose up &&
    echo ""
    print_docker
    echo ""
    echo "your app is waiting for you at localhost:8080"
    echo ""
    echo ""
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
 up_mac) up_mac
    ;;
    down) down
    ;;
    *) echo "auch! cannot resolve '$@' :("
    ;;
esac

