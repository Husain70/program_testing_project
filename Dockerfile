FROM openjdk:21
EXPOSE 8000
ADD target/bookstore.jar bookstore.jar
ENTRYPOINT ["java","-jar","/bookstore.jar"]
