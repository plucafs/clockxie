extends Control

func _process(_delta):
	$CountdownContainer/Timer.wait_time = int($CountdownContainer/LineEdit.text)
	$CountdownContainer/Countdown.text = str($CountdownContainer/Timer.time_left)
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		$CountdownContainer/Timer.start()

func _on_Button_pressed():
	$CountdownContainer/Timer.paused = false
	$CountdownContainer/Timer.start()

func _on_Timer_timeout():
	$CountdownContainer/CanvasLayer/AcceptDialog.show()
	pass # Replace with function body.

func _on_PauseTimer_pressed():
	$CountdownContainer/Timer.paused = true
