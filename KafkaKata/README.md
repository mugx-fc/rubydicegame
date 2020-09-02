To start Kafka run the following in order:

1. Start the ZooKeeper service:

`bin/zookeeper-server-start.sh config/zookeeper.properties`

2. Start the Kafka broker service:

`bin/kafka-server-start.sh config/server.properties`

Once all services have successfully launched, you will have a basic Kafka environment running and ready to use.