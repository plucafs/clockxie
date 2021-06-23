extends Control

var date_time = str(OS.get_datetime())

func _process(_delta):
	"""Show hours, minutes, seconds"""
	$ClockContainer/Hour.text = str(OS.get_time()['hour']) + ' h'
	$ClockContainer/Minute.text = str(OS.get_time()['minute']) + ' m'
	$ClockContainer/Seconds.text = str(OS.get_time()['second']) + ' s'
