FROM openjdk:11-slim-buster as compilation
RUN apt-get update && apt-get install -y unzip curl
WORKDIR /gradle
RUN curl -L https://services.gradle.org/distributions/gradle-7.0.2-bin.zip -o gradle-7.0.2-bin.zip
RUN unzip gradle-7.0.2-bin.zip
ENV GRADLE_HOME=/gradle/gradle-7.0.2
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version
COPY build.gradle .
COPY src/ src/
RUN ls -ltr
RUN find . -name '*.jar'
RUN gradle --no-daemon bootJar
RUN find / -name '*.jar'

FROM openjdk:11-slim-buster
COPY --from=compilation  /gradle/build/libs/gradle-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
