extends Label

var date_time = str(OS.get_datetime())

func _ready():
	self.text = date_time
	
func _process(_delta):
	pass
