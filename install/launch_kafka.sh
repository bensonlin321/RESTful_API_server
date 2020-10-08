# start kafka
echo "start kafka"
export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
sleep 2
echo "run zookeeper"
nohup /opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties > /dev/null 2>&1 &
sleep 5
echo "run kafka server"
nohup /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties > /dev/null 2>&1 &
