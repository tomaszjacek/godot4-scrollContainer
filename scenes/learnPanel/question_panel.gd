extends PanelContainer


var just_pressed = false
var prev_pos

var threshold = 5

var results_saved:bool=false
signal question_panel_clicked()


func _ready():

	connect("gui_input", Callable(_on_question_panel_gui_input))	
	mouse_filter = MOUSE_FILTER_PASS

func _process(delta):
	pass



func _on_question_panel_gui_input(event):
#	if event is InputEventMouseButton \
#			and (event.button_index == MOUSE_BUTTON_LEFT \
#			or event.button_index == MOUSE_BUTTON_MASK_RIGHT) \
#			and event.is_pressed():	
#		question_panel_clicked.emit()
#		print("_on_question_panel_gui_input")
	if event is InputEventScreenTouch:
		if event.pressed:
			just_pressed = true
			prev_pos = event.position
			
		if not event.pressed and just_pressed and event.position.distance_to(prev_pos) < threshold:
			just_pressed = false

			if not results_saved:
				M_S.learn_answer_requested.emit()
				results_saved=true
			emit_signal("question_panel_clicked")
			
			
func setlabell(kanji:String,hiragana:String,english:String)->void:
	$MainLabel1.text = kanji
	$MainLabel2.text = english
	$HelpLabel.text = hiragana
	$MainLabel1.type = "Kanji"
	$MainLabel2.type = "English"
	
func hiragana()->void:
	if Global.hiragana_visible:
		$HelpLabel.show()
	else:
		$HelpLabel.hide()
