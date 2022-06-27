extends CenterContainer

onready var hour = get_node("DateTime/Time/Hour")
onready var minute = get_node("DateTime/Time/Minute")
onready var seconds = get_node("DateTime/Time/Seconds")

onready var day = get_node("DateTime/Date/Day")
onready var month = get_node("DateTime/Date/Month")
onready var year = get_node("DateTime/Date/Year")

onready var weekday = get_node("DateTime/Date/Weekday")

#--------------------------------------------------

func _process(_delta):
	"""Show hours, minutes, seconds and date"""
	hour.text = str(OS.get_time()['hour']) + ' h - '
	minute.text = str(OS.get_time()['minute']) + ' m - '
	seconds.text = str(OS.get_time()['second']) + ' s'
	
	day.text = str(OS.get_date()['day']) + '/'
	month.text = str(OS.get_date()['month']) + '/'
	year.text = str(OS.get_date()['year']) + ' - '
	weekday.text = "Weekday: " + str(OS.get_date()['weekday'])

