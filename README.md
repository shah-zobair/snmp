# snmp
RHEL Atomic Monitoring

docker build -t snmp .

docker run restart=always -it --name snmp --privileged       --ipc=host --net=host --pid=host -e HOST=/host        -e NAME=snmp -e IMAGE=snmp        -v /run:/run -v /var/log:/var/log        -v /etc/localtime:/etc/localtime -v /:/host -d snmp tail -f /dev/null

iptables -A OS_FIREWALL_ALLOW -p udp --dport 161 -j ACCEPT

