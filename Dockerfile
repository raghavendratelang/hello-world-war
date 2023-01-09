FROM maven:3.8.2-openjdk-8 as build_stage
WORKDIR /prajwal
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /prajwal/target/hello-world-war-null.war /usr/local/tomcat/webapps/


