extends Control

var current_time

func _process(_delta):
	$CountdownContainer/Countdown.text = _format_timer_output(_time_converter(int($CountdownContainer/Timer.time_left)))
	
#func _input(_event):
#	if Input.is_action_just_pressed("ui_accept"):
#		$CountdownContainer/Timer.start()

func _on_Button_pressed():
	var line_edit_text = $CountdownContainer/LineEdit.text
	if(_check_label_characters(line_edit_text)):
		$CountdownContainer/Timer.paused = false
		$CountdownContainer/Timer.start(int(line_edit_text))
		$CountdownContainer/PauseTimer.text = "Pause timer"
	$CountdownContainer/LineEdit.text = ""

func _on_Timer_timeout():
	$CountdownContainer/CanvasLayer/AcceptDialog.show()

func _on_PauseTimer_pressed():
	$CountdownContainer/LineEdit.text = ""	
	if($CountdownContainer/Timer.paused && current_time > 0.001):
		$CountdownContainer/Timer.paused = false
		$CountdownContainer/Timer.start(int(current_time))
		$CountdownContainer/PauseTimer.text = "Pause timer"
		return
	$CountdownContainer/Timer.paused = true
	current_time = int($CountdownContainer/Timer.time_left)
	if(current_time > 0.001):
		$CountdownContainer/PauseTimer.text = "Resume timer"

func _check_label_characters(string):
	if (len(string) == 0 || ord(string[0]) == 48):
		return false
	for character in string:
		if(ord(character) < 48 || ord(character) > 57):
			return false
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
	
