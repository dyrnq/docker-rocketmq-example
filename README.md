# docker-rocketmq-example

## Quickstart

### docker

```bash
docker run -it --rm dyrnq/rocketmq:4.8.0 mqnamesrv

docker run -it --rm dyrnq/rocketmq:4.8.0 mqbroker
```

### docker-compose-example

```bash
cd compose

# start
./launch.sh

# or

./launch.sh -d

# remove

./launch.sh -r

```

```bash
jim@debian:~/docker-rocketmq-example/compose$ docker-compose ps
   Name                 Command               State                     Ports                  
-----------------------------------------------------------------------------------------------
mqbroker1    /docker-entrypoint.sh mqbr ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
mqbroker2    /docker-entrypoint.sh mqbr ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
mqbroker3    /docker-entrypoint.sh mqbr ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
mqnamesrv1   /docker-entrypoint.sh mqna ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
mqnamesrv2   /docker-entrypoint.sh mqna ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
mqnamesrv3   /docker-entrypoint.sh mqna ...   Up      10909/tcp, 10911/tcp, 10912/tcp, 9876/tcp
rmqconsole   sh -c java $JAVA_OPTS -jar ...   Up      0.0.0.0:28080->8080/tcp                  
```

```bash
# no mqbroker1
docker exec -it mqbroker1

./mqadmin clusterList -n mqnamesrv1:9876
RocketMQLog:WARN No appenders could be found for logger (io.netty.util.internal.PlatformDependent0).
RocketMQLog:WARN Please initialize the logger system properly.
#Cluster Name     #Broker Name            #BID  #Addr                  #Version                #InTPS(LOAD)       #OutTPS(LOAD) #PCWait(ms) #Hour #SPACE
DefaultCluster    mqbroker1               0     172.222.0.6:10911      V4_8_0                   0.00(0,0ms)         0.00(0,0ms)          0 448636.55 0.2411
DefaultCluster    mqbroker2               0     172.222.0.7:10911      V4_8_0                   0.00(0,0ms)         0.00(0,0ms)          0 448636.55 0.2411
DefaultCluster    mqbroker3               0     172.222.0.8:10911      V4_8_0                   0.00(0,0ms)         0.00(0,0ms)          0 448636.55 0.2411
```

### k8s-example

```bash
cd k8s
kubectl apply -f rocketmq-example.yml

# get namesrv
kubectl get pod -o wide -lapp=rocketmq-namesrv

# get broker
kubectl get pod -o wide -lapp=rocketmq-broker

```

## ref

* <https://github.com/dyrnq/docker-rocketmq>
* <https://hub.docker.com/r/dyrnq/rocketmq>
