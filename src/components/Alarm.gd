extends Control

#var user_alarm = {
#
#	$HourLabel.text = 
#
#}

func _process(_delta):
	$LineEdit.text = $HourLabel.text
	alarm_time()
	
func alarm_time():
	if int($HourLabel.text) == OS.get_time()['hour']: 
		print('Ring ring ring')
