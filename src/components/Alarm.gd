extends Control

onready var alarm_label_hour = get_node("AlarmLabel/AlarmLabelHour")
onready var alarm_label_minutes = get_node("AlarmLabel/AlarmLabelMinutes")

onready var alarm_text_hour = get_node("AlarmTexts/ChangeAlarmHour")
onready var alarm_text_minute = get_node("AlarmTexts/ChangeAlarmMinutes")

onready var set_alarm = get_node("SetAlarm")
onready var stop_alarm = get_node("StopAlarm")
onready var reset_stop_alarm = get_node("ResetStopAlarm")

onready var sound_alarm = get_node("Alarm")

var sound_alarm_count = 0
var sound_alarm_stop = true
var number_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ,15]

#--------------------------------------------------

func _process(_delta):
	if sound_alarm_count == 0:
		ring_ring()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_SetAlarm_pressed()

func ring_ring():
	if int(alarm_label_hour.text) == OS.get_time()['hour'] and int(alarm_label_minutes.text) == OS.get_time()['minute'] and sound_alarm_stop: 
		sound_alarm_count += 1
		sound_alarm.play()
		
func _on_SetAlarm_pressed():
	alarm_label_hour.text = ' '
	alarm_label_hour.text += alarm_text_hour.text
	alarm_label_minutes.text = ' '
	alarm_label_minutes.text += alarm_text_minute.text

func _on_Alarm_finished():
	if sound_alarm_count == 1:
		ring_ring()
	elif sound_alarm_count == 2:
		ring_ring()
	elif sound_alarm_count == 3:
		ring_ring()
	elif sound_alarm_count == 4:
		ring_ring()
	elif sound_alarm_count == 5:
		ring_ring()
	elif sound_alarm_count == 6:
		ring_ring()
	elif sound_alarm_count == 7:
		ring_ring()
	elif sound_alarm_count == 8:
		ring_ring()
	elif sound_alarm_count == 9:
		ring_ring()
	elif sound_alarm_count == 10:
		ring_ring()
	else:
		pass

func _on_StopAlarm_pressed():
	sound_alarm_stop = false
	reset_stop_alarm.start()
	
func _on_ResetStopAlarmTimer_timeout():
	sound_alarm_stop = true
	sound_alarm_count = 0
	print(sound_alarm_stop)
	
