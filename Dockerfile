FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY Grater.java .
RUN javac Grater.java
CMD ["java", "Grater"]
