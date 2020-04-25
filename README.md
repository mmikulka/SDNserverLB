Mininet files: Can be launched from everywhere:

one_level_topo.py: python to setup topology in mininet

one_level_topo.mn: miniedit file just incase you want to manipulate topo setup

Start up Mininet:

$ sudo python one_level_topo.py

to start servers on mininet hosts:

option1:
open external CLI for each server host:
xterm h2
xterm h3
xterm h4
xterm h5

on each external CLI
python -m SimpleHTTPServer 80

this way each time you access a server a message will appear on the command line letting you know the server is accessed.

option2

on each server host:
python -m SimpleHTTPServer 80 &

less windows, but harder to troubleshoot

pox files:

myip_loadbalancer.py: load balancer script that runs on switch.

mystartup.py: the startup script for pox to launch myip_loadbalancer.

myl2_learning.py: l2 learning switch (not currently used, but could be useful in the future

all of these files need to be coppied into  ~/pox/ext folder


start pox:

from the pox main folder

./pox.py mystartup.py


once everything is setupyou can use the mininet command line to curl into 10.0.1.1:80 to test connections from h1 to the servers. 
