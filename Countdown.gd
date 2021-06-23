extends VBoxContainer

var current_time
func _process(_delta):	
	$Countdown.text = str($Timer.time_left)
	if(float($Countdown.text) == 0):
		$Button.text = "Start timer"

#func _input(event):
#	if Input.is_action_just_pressed("ui_accept"):
#		$Timer.start()

func _on_Button_pressed():
	if(_check_label_characters($LineEdit.text)):
		$Button.text = "Stop timer"
		$Timer.wait_time = float($LineEdit.text)
		$Timer.start($Timer.wait_time)
		$Timer.paused = false
		$LineEdit.text = ""
		return
	if(!$Timer.paused):
		$Button.text = "Start timer"
		$Timer.paused = true
		current_time = float($Countdown.text)
	elif(float($Countdown.text) > 0):
		$Button.text = "Stop timer"
		$Timer.start(current_time)
		$Timer.paused = false
	$LineEdit.text = ""

func _check_label_characters(string):
	if (len(string) == 0 || ord(string[0]) == 48):
		return false
	for ch in string:
		if(ord(ch) < 48 || ord(ch) > 57):
			return false
	return true
