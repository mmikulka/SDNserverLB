

def launch():

	from pox.log.level import launch
	launch(DEBUG=True)

	from pox.samples.pretty_log import launch
	launch()

	from myl2_learning import launch
	launch(ignore="1")

	from myip_loadbalancer import launch
	launch(ip="10.0.1.1",servers="10.0.0.2,10.0.0.3,10.0.0.4,10.0.0.5")

