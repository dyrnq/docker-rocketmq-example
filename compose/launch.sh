#!/usr/bin/env bash



for var in "mqnamesrv1" "mqnamesrv2" "mqnamesrv3" "mqbroker1" "mqbroker2" "mqbroker3" ; do
    for dir in "index" "commitlog" "consumequeue" ; do
        if [ ! -d persistent/"$var"/store/"$dir" ]; then
            mkdir -p persistent/"$var"/store/"$dir"
        fi
    done
    
    if [ ! -d persistent/"$var"/logs ]; then
        mkdir -p persistent/"$var"/logs
    fi
done

DETACHED=${DETACHED:-}
while [ $# -gt 0 ]; do
    case "$1" in
        --detached|-d)
            DETACHED=1
            ;;
         --remove|-r)
            remove_flag="1";
            ;;
         --rr|-rr)
            remove_flag="2"
            ;;
        --*)
            echo "Illegal option $1"
            ;;
    esac
    shift $(( $# > 0 ? 1 : 0 ))
done

docker_compose_cmd="docker-compose";
if command -v docker-compose 2>/dev/null 1>/dev/null; then
    :
elif docker compose version; then
    docker_compose_cmd="docker compose"
else
    echo "docker compose Not found,please install..."
    exit 1;
fi



is_detached() {
    if [ -z "$DETACHED" ]; then
        return 1
    else
        return 0
    fi
}

fun_up(){

sed -e "s@_BROKERNAME@mqbroker1@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker1.conf
sed -e "s@_BROKERNAME@mqbroker2@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker2.conf
sed -e "s@_BROKERNAME@mqbroker3@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker3.conf



if is_detached; then
    ${docker_compose_cmd} up -d
else
    ${docker_compose_cmd} up
fi

}


if [ "$remove_flag" = "1" ]; then
    echo "will remove all containers, ${docker_compose_cmd} down"
    ${docker_compose_cmd} down
elif [ "$remove_flag" = "2" ]; then
    echo "will remove all containers and data, ${docker_compose_cmd} down --volumes"
    ${docker_compose_cmd} down --volumes
else
    fun_up
fi
