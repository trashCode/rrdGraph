#!/bin/bash
#initialisation
echo == `date`===
#verdun
if [[ -r /var/www/rrdgraph/data/verdun.rrd ]];then
	echo verdun.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/verdun.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo verdun.rrd recréé
fi

#partdieu
if [[ -r /var/www/rrdgraph/data/partdieu.rrd ]];then
	echo partdieu.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/partdieu.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  pardieu.rrd recréé
fi

#villeurbanne
if [[ -r /var/www/rrdgraph/data/villeurbanne.rrd ]];then
	echo villeurbanne.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/villeurbanne.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  villeurbanne.rrd recréé
fi

#Oullins
if [[ -r /var/www/rrdgraph/data/oullins.rrd ]];then
	echo  oullins.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/oullins.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  oullins.rrd recréé
fi

#saintfons
if [[ -r /var/www/rrdgraph/data/saintfons.rrd ]];then
	echo  saintfons.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/saintfons.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  saintfons.rrd recréé
fi


#caluire
if [[ -r /var/www/rrdgraph/data/caluire.rrd ]];then
	echo  caluire.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/caluire.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  caluire.rrd recréé
fi

#etatsunis
if [[ -r /var/www/rrdgraph/data/etatsunis.rrd ]];then
	echo  etatsunis.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/etatsunis.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  etatsunis.rrd recréé
fi

#jeanmace
if [[ -r /var/www/rrdgraph/data/jeanmace.rrd ]];then
	echo  jeanmace.rrd lisible.
else
	rrdtool create /var/www/rrdgraph/data/jeanmace.rrd --step 60 DS:in1:COUNTER:120:U:U DS:out1:COUNTER:120:U:U DS:in2:COUNTER:120:U:U DS:out2:COUNTER:120:U:U RRA:AVERAGE:0.5:1:1440 RRA:AVERAGE:0.5:30:1440
	echo  jeanmace.rrd recréé
fi

rrdtool update /var/www/rrdgraph/data/verdun.rrd N:`snmpget -OQv -c public -v1 192.168.1.252 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.1.252 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.1.252 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.1.252 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/partdieu.rrd N:`snmpget -OQv -c public -v1 192.168.2.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.2.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.2.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.2.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/villeurbanne.rrd N:`snmpget -OQv -c public -v1 192.168.3.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.3.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.3.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.3.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/oullins.rrd N:`snmpget -OQv -c public -v1 192.168.4.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.4.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.4.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.4.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/saintfons.rrd N:`snmpget -OQv -c public -v1 192.168.6.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.6.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.6.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.6.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/caluire.rrd N:`snmpget -OQv -c public -v1 192.168.7.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.7.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.7.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.7.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/etatsunis.rrd N:`snmpget -OQv -c public -v1 192.168.9.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.9.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.9.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.9.254 ifOutOctets.2`
rrdtool update /var/www/rrdgraph/data/jeanmace.rrd N:`snmpget -OQv -c public -v1 192.168.10.254 ifInOctets.1`:`snmpget -OQv -c public -v1 192.168.10.254 ifOutOctets.1`:`snmpget -OQv -c public -v1 192.168.10.254 ifInOctets.2`:`snmpget -OQv -c public -v1 192.168.10.254 ifOutOctets.2`
