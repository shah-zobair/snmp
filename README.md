# snmp
RHEL Atomic Monitoring

docker build -t snmp .

docker run -it --name snmp --privileged       --ipc=host --net=host --pid=host -e HOST=/host        -e NAME=snmp -e IMAGE=snmp        -v /run:/run -v /var/log:/var/log        -v /etc/localtime:/etc/localtime -v /:/host -d snmp tail -f /dev/null
