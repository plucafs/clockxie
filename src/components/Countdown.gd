extends Control

onready var countdown_text = get_node("Time/Countdown")
onready var start_timer = get_node("Buttons/StartTimer")
onready var pause_timer = get_node("Buttons/PauseTimer")
onready var separator_countodwn_text = get_node("Time/HSeparator")
onready var reset_timer

onready var hour_text = get_node("Time/Hour")
onready var minutes_text = get_node("Time/Minutes")
onready var seconds_text = get_node("Time/Seconds")

var current_time

func _process(_delta):
#	separator_countodwn_text.rect_size.y = countdown_text.rect_size.y
	
	countdown_text.text = _format_timer_output(_time_converter(int($Timer.time_left)))
	
func _on_StartTimer_pressed():
	var complete_seconds = (int(hour_text.text) * 3600) + (int(minutes_text.text) * 60) + (int(seconds_text.text))
	print(complete_seconds)
	if(_check_label_characters(complete_seconds)):
		$Timer.paused = false
		$Timer.start(int(complete_seconds))
		pause_timer.text = "Pause timer"
	hour_text.text = ""
	minutes_text.text = ""
	seconds_text.text = ""

func _on_Timer_timeout():
	$CanvasLayer/AcceptDialog.show()

func _on_PauseTimer_pressed():
	if($Timer.paused && current_time > 0.001):
		$Timer.paused = false
		$Timer.start(int(current_time))
		pause_timer.text = "Pause timer"
		return
	$Timer.paused = true
	current_time = int($Timer.time_left)
	if(current_time > 0.001):
		pause_timer.text = "Resume timer"

func _check_label_characters(string):
#	if (len(string) == 0 || ord(string[0]) == 48):
#		return false
#	for character in string:
#		if(ord(character) < 48 || ord(character) > 57):
#			return false
	return true

func _time_converter(seconds):
	var hours = int(seconds / 3600)
	var minutes = int(seconds/60) - hours * 60
	seconds -= minutes * 60 + hours * 3600
	return [hours, minutes, seconds]

func _format_timer_output(time):
	var output = ""
	for i in range(len(time)):
		output += str(time[i]) + " : "
	output = output.substr(0, len(output) - 2)
	return output



	
