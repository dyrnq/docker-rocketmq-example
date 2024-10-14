# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.


# 集群名字
brokerClusterName=DefaultCluster

# broker名字
brokerName=_BROKERNAME

# 0表示Master >0表示Slave
brokerId=0

# nameServer地址分号分割
namesrvAddr=_NAMESRVADDR

# 自动创建Topic的话，默认queue数量是多少
defaultTopicQueueNums=4

# 是否允许Broker自动创建Topic，建议线下开启，线上关闭
autoCreateTopicEnable=true

# 是否允许Broker自动创建订阅组，建议线下开启，线上关闭
autoCreateSubscriptionGroup=true

# 监听端口
listenPort=10911

# 文件删除时间点，默认凌晨4点
deleteWhen=04

# 文件保留时长，默认48小时
fileReservedTime=120

# commitLog每个文件的大小默认1G
# mapedFileSizeCommitLog=1073741824

# ConsumeQueue每个文件默认存30W条
# mapedFileSizeConsumeQueue=300000

#destroyMapedFileIntervalForcibly=120000

#redeleteHangedFileInterval=120000

# 检测物理文件磁盘空间
diskMaxUsedSpaceRatio=88

# 存储路径
#storePathRootDir=/rocketmq/store

# commitLog 存储路径
#storePathCommitLog=/rocketmq/store/commitlog

# 消费队列存储
#storePathConsumeQueue=/rocketmq/store/consumequeue

# 消息索引存储路径
#storePathIndex=/rocketmq/store/index

# checkpoint 文件存储路径
#storeCheckpoint=/rocketmq/store/checkpoint

# abort 文件存储路径
#abortFile=/rocketmq/store/abort

# 限制的消息大小
maxMessageSize=65536

#flushCommitLogLeastPages=4

#flushConsumeQueueLeastPages=2

#flushCommitLogThoroughInterval=10000

#flushConsumeQueueThoroughInterval=60000

# Broker的角色
# ASYNC_MASTER 异步复制Master
# SYNC_MASTER 同步双写Master
# SLAVE
brokerRole=ASYNC_MASTER

# 刷盘方式
# ASYNC_FLUSH 异步刷盘
# SYNC_FLUSH 同步刷盘
flushDiskType=ASYNC_FLUSH

# 发消息线程池数量
#sendMessageThreadPoolNums=128

# 拉消息线程池数量
#pullMessageThreadPoolNums=128