FROM maven:3-jdk-8 as builder

RUN apt-get update
RUN apt-get install git -y

WORKDIR /opt

RUN git clone https://github.com/IEEEIHUSerres/Spring-Boot-Workshop.git app

WORKDIR /opt/app

RUN mvn package

FROM openjdk:8u252-jre-slim-buster

COPY --from=builder /opt/app/target/spring-boot-demo-0.0.1-SNAPSHOT.jar /opt/app.jar

EXPOSE 8080

CMD ["java","-jar","/opt/app.jar"]