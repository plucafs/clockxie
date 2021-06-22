extends VBoxContainer

func _process(_delta):
	$Timer.wait_time = int($LineEdit.text)
	$Countdown.text = str($Timer.time_left)
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		$Timer.start()

func _on_Button_pressed():
	$Timer.start()
