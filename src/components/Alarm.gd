extends Control

func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_SetAlarm_pressed()

func ring_ring():
	if int($AlarmLabelHour.text) == OS.get_time()['hour'] and int($AlarmLabelMinutes.text) == OS.get_time()['minute']: 
		$Alarm.play()
		
func _on_SetAlarm_pressed():
	$AlarmLabelHour.text = ' '
	$AlarmLabelHour.text += $ChangeAlarmHour.text
	$AlarmLabelMinutes.text = ' '
	$AlarmLabelMinutes.text += $ChangeAlarmMinutes.text
