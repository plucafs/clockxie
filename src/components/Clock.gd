extends Control

func _process(_delta):
	"""Show hours, minutes, seconds and date"""
	$Hour.text = str(OS.get_time()['hour']) + ' h'
	$Minute.text = str(OS.get_time()['minute']) + ' m'
	$Seconds.text = str(OS.get_time()['second']) + ' s'
	$Date/Day.text = str(OS.get_date()['day']) + '/'
	$Date/Month.text = str(OS.get_date()['month']) + '/'
	$Date/Year.text = str(OS.get_date()['year']) + ' - '
	$Date/Weekday.text = "Weekday: " + str(OS.get_date()['weekday'])

