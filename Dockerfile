FROM eclipse-temurin:17
LABEL project="IBM" 
LABEL author="aditya"
ADD https://referenceappslt.s3.ap-south-1.amazonaws.com/spring-petclinic-3.3.0-SNAPSHOT.jar /spring-petclinic-3.3.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-3.3.0-SNAPSHOT.jar" ]