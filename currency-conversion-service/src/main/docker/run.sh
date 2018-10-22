#!/bin/sh

echo "********************************************************"
echo "Waiting for the eureka server to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z eurekaserver  $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"

echo "********************************************************"
echo "********************************************************"
echo "Waiting for the RabbitMQ to start on port $RABBIT_PORT"
echo "********************************************************"
while ! `nc -z rabbitmq  $RABBIT_PORT`; do sleep 3; done
echo "******* RabbitMQ has started"

echo "********************************************************"
echo "Waiting for the Zipkin server to start on port $ZIPKIN_PORT"
echo "********************************************************"
while ! `nc -z zipkin $ZIPKIN_PORT`; do sleep 3; done
echo "*******  Zipkin Server has started"

echo "********************************************************"
echo "Starting Zuul Service with $ZUULSERVER_PORT"
echo "********************************************************"
echo "********************************************************"
echo "Waiting for the mysql to start on port $ZUULSERVER_PORT"
echo "********************************************************"
while ! `nc -z zuulserver  $ZUULSERVER_PORT`; do sleep 3; done
echo "******* Zuul Server has started"



echo "********************************************************"
java -Djava.security.egd=file:/dev/./urandom -Dserver.port=$SERVER_PORT  \
-Dspring.rabbitmq.addresses=$RABBIT_URI \
-Dspring.zipkin.base-url=$ZIPKIN_URI \
-Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI  \
-jar /usr/local/converter/@project.build.finalName@.jar


