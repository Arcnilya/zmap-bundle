#!/bin/sh

path="/home/ubuntu"
prot="udp"
port="53"
pkt="$path/zmap-bundle/zmap-3.0.0/examples/udp-probes/dns_53.pkt"
fname="$path/scans/zmap-$prot-$port-$(date +%Y-%m-%d).txt"
# Blocklist is defined in /etc/zmap/blocklist.conf
cat blocklist.conf >> /etc/zmap/blocklist.conf
zmap --rate=30000 --probe-module=$prot -p $port --probe-args=file:$pkt -o $fname 
