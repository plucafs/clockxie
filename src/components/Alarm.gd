extends Control

func _process(_delta):
	ring_ring()
	
func ring_ring():
	if int($AlarmContainer/AlarmLabelHour.text) == OS.get_time()['hour'] and int($AlarmContainer/AlarmLabelMinutes.text) == OS.get_time()['minute']: 
		$RingRing.play()
		alarm_sound()
		print('Ring Ring')

func alarm_sound():
	$RingRing.play()
	$RingRing.stream_paused = false

func _on_SetAlarmHour_pressed():
	$AlarmContainer/AlarmLabelHour.text = ' '
	$AlarmContainer/AlarmLabelHour.text += $AlarmContainer/ChangeAlarmHour.text
	

func _on_SetAlarmMinutes_pressed():
	$AlarmContainer/AlarmLabelMinutes.text = ' '
	$AlarmContainer/AlarmLabelMinutes.text += $AlarmContainer/ChangeAlarmMinutes.text

	
