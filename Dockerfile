FROM progrium/busybox
MAINTAINER pjpires@gmail.com

# Add stuff
RUN opkg-install curl grep ca-certificates

# Get and install JRE 8 Updated 45
RUN \
  (curl -Lskj -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jre-8u45-linux-x64.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv jre1.8.0_45 /opt/ && \
  rm -rf $(find /opt/ | grep -E "/jre1.8.0_45/lib/(desktop|locale|fonts|plugin)/")

# Set $JAVA_HOME
ENV JAVA_HOME /opt/jre1.8.0_45

# Link Java into use
RUN ln -s /opt/jre1.8.0_45/bin/java /usr/bin/java
