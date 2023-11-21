extends PanelContainer

var just_pressed = false
var prev_pos

var threshold = 5

signal answer_panel_clicked()

func _ready():

	connect("gui_input", Callable(_on_answer_panel_gui_input))	
	mouse_filter = MOUSE_FILTER_PASS



func _process(delta):
	pass

func _on_answer_panel_gui_input(event):
#	if event is InputEventMouseButton \
#			and (event.button_index == MOUSE_BUTTON_LEFT \
#			or event.button_index == MOUSE_BUTTON_MASK_RIGHT) \
#			and event.is_pressed():	
#		answer_panel_clicked.emit()
#		print("_on_answer_panel_gui_input")
	if event is InputEventScreenTouch:
		if event.pressed:
			just_pressed = true
			prev_pos = event.position
			
		if not event.pressed and just_pressed and event.position.distance_to(prev_pos) < threshold:
			just_pressed = false
			emit_signal("answer_panel_clicked")
	
func setlabell(t:String)->void:
	$Label.text = t
	print(t)
