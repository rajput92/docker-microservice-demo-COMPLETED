FROM openjdk:8u171-jdk-alpine3.8
RUN apk update && apk upgrade && apk add netcat-openbsd && apk add --no-cache bash
#RUN
RUN mkdir -p /usr/local/eurekaserver
ADD @project.build.finalName@.jar /usr/local/eurekaserver/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh

