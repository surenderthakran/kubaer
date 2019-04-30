FROM openjdk:8-jdk-alpine

LABEL version="1.0"

MAINTAINER https://github.com/surenderthakran

ARG MAVEN_VERSION=3.6.1
ARG MAVEN_URL=https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ARG MAVEN_TAR=/usr/local/maven/apache-maven-bin.tar.gz

ARG PROJECT_ROOT_DIR="/home"

# Add required packages.
RUN apk add --no-cache \
    bash \
    curl \
    tar

# Install maven.
RUN mkdir -p /usr/local/maven \
  && curl -SL -o ${MAVEN_TAR} ${MAVEN_URL} \
  && tar -C /usr/local/maven --strip-components=1 -xzf ${MAVEN_TAR} \
  && rm ${MAVEN_TAR} \
  && ln -s /usr/local/maven/bin/mvn /usr/bin/mvn

COPY . $PROJECT_ROOT_DIR

WORKDIR $PROJECT_ROOT_DIR
