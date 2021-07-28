extends Control

var current_time

func _process(_delta):
	$Countdown.text = _format_timer_output(_time_converter(int($Timer.time_left)))
	
func _on_StartTimer_pressed():
	var complete_seconds = (int($Time/Hour.text) * 3600) + (int($Time/Minutes.text) * 60) + (int($Time/Seconds.text))
	print(complete_seconds)
	if(_check_label_characters(complete_seconds)):
		$Timer.paused = false
		$Timer.start(int(complete_seconds))
		$PauseTimer.text = "Pause timer"
	$Time/Hour.text = ""
	$Time/Minutes.text = ""
	$Time/Seconds.text = ""

func _on_Timer_timeout():
	$CanvasLayer/AcceptDialog.show()

func _on_PauseTimer_pressed():
	if($Timer.paused && current_time > 0.001):
		$Timer.paused = false
		$Timer.start(int(current_time))
		$PauseTimer.text = "Pause timer"
		return
	$Timer.paused = true
	current_time = int($Timer.time_left)
	if(current_time > 0.001):
		$PauseTimer.text = "Resume timer"

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



	
