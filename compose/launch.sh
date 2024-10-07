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
            docker-compose down
            exit 0
            ;;
        --*)
            echo "Illegal option $1"
            ;;
    esac
    shift $(( $# > 0 ? 1 : 0 ))
done

sed -e "s@_BROKERNAME@mqbroker1@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker1.conf
sed -e "s@_BROKERNAME@mqbroker2@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker2.conf
sed -e "s@_BROKERNAME@mqbroker3@g" -e "s@_NAMESRVADDR@mqnamesrv1:9876;mqnamesrv2:9876;mqnamesrv3:9876@" broker.sed > mqbroker3.conf


is_detached() {
    if [ -z "$DETACHED" ]; then
        return 1
    else
        return 0
    fi
}

if is_detached; then
    docker-compose up -d
else
    docker-compose up
fi
