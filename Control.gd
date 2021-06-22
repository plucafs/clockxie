extends Control

var date_time = str(OS.get_datetime())

func _process(_delta):
	$Clock/Hour.text = str(OS.get_time()['hour']) + ' h'
	$Clock/Minute.text = str(OS.get_time()['minute']) + ' m'
	$Clock/Seconds.text = str(OS.get_time()['second']) + ' s'
