FROM openjdk:8-jdk-alpine

LABEL version="1.0"

MAINTAINER https://github.com/surenderthakran

ARG MAVEN_VERSION=3.6.1
ARG MAVEN_URL=https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ARG MAVEN_CHECKSUM="b4880fb7a3d81edd190a029440cdf17f308621af68475a4fe976296e71ff4a4b546dd6d8a58aaafba334d309cc11e638c52808a4b0e818fc0fd544226d952544  apache-maven-3.6.1-bin.tar.gz"

ARG PROJECT_ROOT_DIR="/home"

# Add required packages.
RUN apk add --no-cache \
    bash \
    curl \
    tar

RUN mkdir -p /usr/local/maven \
  && curl -SL -o /usr/local/maven/apache-maven-${MAVEN_VERSION}-bin.tar.gz ${MAVEN_URL} \
  && echo "${MAVEN_CHECKSUM}" | sha512sum -c - \
  && tar -C /usr/local/maven -xzf "apache-maven-${MAVEN_VERSION}-bin.tar.gz" \

COPY . $PROJECT_ROOT_DIR

WORKDIR $PROJECT_ROOT_DIR

RUN make --no-print-directory install

CMD make --no-print-directory run
