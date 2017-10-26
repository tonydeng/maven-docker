# Alpine Linux with  Oracle Java 8 And Maven 3.5
FROM wolfdeng/java

MAINTAINER Tony Deng (wolf.deng@gmail.com)

ENV MAVEN_VERSION=3.5.2 \
    MAVEN_HOME=/opt/maven \
    PATH=$PATH:$MAVEN_HOME/bin

# install maven
RUN wget http://mirror.navercorp.com/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar xzf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv apache-maven-$MAVEN_VERSION /opt/ && \
    ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven

# clean
RUN rm -rf /var/cache/apk/* \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz

COPY settings.xml /opt/maven/settings.xml

VOLUME ["/opt/repository"]
