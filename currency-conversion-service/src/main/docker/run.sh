#!/bin/sh

echo "********************************************************"
echo "Waiting for the eureka server to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z eurekaserver  $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"

echo "********************************************************"
echo "********************************************************"
echo "Waiting for RabbitMQ to start on port $RABBIT_PORT"
echo "********************************************************"
while ! `nc -z rabbitmq  $RABBIT_PORT`; do sleep 3; done
echo "******* RabbitMQ has started"
#echo "********************************************************"
#echo "Waiting for the configuration server to start on port $CONFIGSERVER_PORT"
#echo "********************************************************"
#while ! `nc -z configserver $CONFIGSERVER_PORT`; do sleep 3; done
#echo "*******  Configuration Server has started"

echo "********************************************************"
#echo "Starting Zuul Service with $CONFIGSERVER_URI"
echo "********************************************************"

echo "********************************************************"
java -Djava.security.egd=file:/dev/./urandom -Dserver.port=$SERVER_PORT  \
-Dspring.rabbitmq.addresses=$RABBIT_URI \
-Dspring.zipkin.base-url=$ZIPKIN_URI \
-Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI  \
-jar /usr/local/converter/@project.build.finalName@.jar
#     java  -jar /usr/local/zuulgateway/@project.build.finalName@.jar

