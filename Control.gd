extends Control

var date_time = str(OS.get_datetime())

func _process(_delta):
	$HBoxContainer/Clock/Hour.text = str(OS.get_time()['hour']) + ' h'
	$HBoxContainer/Clock/Minute.text = str(OS.get_time()['minute']) + ' m'
	$HBoxContainer/Clock/Seconds.text = str(OS.get_time()['second']) + ' s'

func _on_Timer_timeout():
	$CanvasLayer/AcceptDialog.show()
