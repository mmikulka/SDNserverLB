

def launch():

	from pox.log.level import launch
	launch(DEBUG=True)

	from pox.samples.pretty_log import launch
	launch()

	from myl2_learning import launch
	launch(ignore="1")

	from mymessaging_ip_loadbalancer import launch
	launch(ip1="10.0.1.1",ip2="10.0.2.1",servers="10.0.0.2,10.0.0.3,10.0.0.4,10.0.0.5")
	
	from messenger.tcp_transport import launch
        launch()

