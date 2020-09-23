FROM maven as build
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN mvn clean install
FROM openjdk:8
COPY --from=build /app/target/spring-boot-crud-operation.jar /app/target/spring-boot-crud-operation.jar
EXPOSE 8800
ENTRYPOINT ["java", "-jar", "/app/target/spring-boot-crud-operation.jar"]