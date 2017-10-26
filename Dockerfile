# Alpine Linux with  Oracle Java 8 And Maven 3.5
FROM wolfdeng/java

MAINTAINER Tony Deng (wolf.deng@gmail.com)

ENV MAVEN_VERSION=3.5.2 \
    MAVEN_HOME=/opt/maven \
    PATH=$PATH:$MAVEN_HOME/bin

RUN apk update && \
    apk add curl && \
    curl -sSL http://mirror.navercorp.com/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/maven.tar.gz && \
    mkdir -p /opt/repository && \
    tar -Czxvf /opt /tmp/maven.tar.gz && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
    rm -rf /var/cache/apk/* \
            /tmp/*

COPY settings.xml /opt/maven/settings.xml

VOLUME ["/opt/repository"]
