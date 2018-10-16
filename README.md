# docker-microservice-demo-COMPLETED
#Build the application
mvn clean package docker:build
#Run the application
 docker-compose -f docker/common/dc.yml up
In case of failure of any service run the above command once again.
