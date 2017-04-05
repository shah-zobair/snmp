FROM lpe/rhel7

MAINTAINER Shah Zobair <szobair@redhat.com>

RUN echo "yum-master.example.com" > /etc/yum/vars/build_server && \
    echo "rhel7-latest" > /etc/yum/vars/buildtag && \
    echo "prod" > /etc/yum/vars/environment && \
    echo "latest" > /etc/yum/vars/patchlevel

ADD container.repo /etc/yum.repos.d/

RUN yum update -y && \
    yum install -y net-snmp net-snmp-utils && yum clean all

RUN echo "view    systemview    included   .1.3.6.1.2.1.25" >> /etc/snmp/snmpd.conf && \
    echo "view    systemview    included   .1.3.6.1.4.1.2021" >> /etc/snmp/snmpd.conf && \
    echo "rouser  tivoli_vcs authnopriv" >> /etc/snmp/snmpd.conf && \
    echo "createUser tivoli_vcs MD5 "****" DES" >> /etc/snmp/snmpd.conf
    
RUN snmpd && \
    sed -i /^createUser/d /etc/snmp/snmpd.conf

EXPOSE 161


#CMD ["snmpd", "-D", "FOREGROUND"]
ENTRYPOINT snmpd && /bin/bash
