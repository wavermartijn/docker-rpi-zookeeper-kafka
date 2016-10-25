# https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-14-04 

 met SEDnog zetten server properties advertised host name enzovoort

FROM waver/rpi-java8

USER root

ENV KAFKA_HEAP_OPTS -Xmx128M -Xms128M

EXPOSE 2181 9092

COPY download-install-kafka.sh /tmp/
RUN sudo apt-get install zookeeperd 
RUN chmod 755 /tmp/download-install-kafka.sh
RUN /tmp/download-install-kafka.sh
RUN sed -i.bak s/#(advertised.host.name)=(.*)/\1=192.168.1.11/g /root/kafka/config/server.properties 
#CMD service zookeeper start
CMD /usr/share/zookeeper/bin/zkServer.sh start-foreground 
