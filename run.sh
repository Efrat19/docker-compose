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
    for i in 8181 8383
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
    if [[ "`uname`"  == 'Linux' ]]; then
        clean_ports
    fi
    echo "starting docker....."
    docker-compose up --build &&
    echo ""
    print_docker
    echo ""
    echo "your app is waiting for you at localhost:8383"
    echo ""
    echo ""
}

down(){
    docker-compose down
    echo Bye!!
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

