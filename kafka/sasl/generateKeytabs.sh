#!/bin/bash

for principal in zookeeper1 zookeeper2 zookeeper3
do
    docker exec -it quickstart.confluent.io kadmin.local -q "addprinc -randkey zookeeper/zookeeper${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
    docker exec -it quickstart.confluent.io kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab zookeeper/zookeeper${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
done

#Zookeeper clients on zookeeper "server"
for principal in zkclient1 zkclient2 zkclient3
do
    docker exec -it quickstart.confluent.io kadmin.local -q "addprinc -randkey zkclient/zookeeper${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
    docker exec -it quickstart.confluent.io kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab zkclient/zookeeper${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
done

#Zookeeper clients on kafka "server"
for principal in zk-kafka-client1 zk-kafka-client2 zk-kafka-client3
do
    docker exec -it quickstart.confluent.io kadmin.local -q "addprinc -randkey zkclient/kafka${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
    docker exec -it quickstart.confluent.io kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab zkclient/kafka${principal: -1}.confluent.io.sasl_kafka@TEST.CONFLUENT.IO"
done

for principal in broker1 broker2 broker3
do
    docker exec -it quickstart.confluent.io kadmin.local -q "addprinc -randkey kafka/kafka${principal: -1}.confluent.io@TEST.CONFLUENT.IO"
    docker exec -it quickstart.confluent.io kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab kafka/kafka${principal: -1}.confluent.io@TEST.CONFLUENT.IO"
done

for principal in saslproducer saslconsumer
do
    docker exec -it quickstart.confluent.io  kadmin.local -q "addprinc -randkey ${principal}@TEST.CONFLUENT.IO"
    docker exec -it quickstart.confluent.io  kadmin.local -q "ktadd -norandkey -k /tmp/keytab/${principal}.keytab ${principal}@TEST.CONFLUENT.IO"
done
