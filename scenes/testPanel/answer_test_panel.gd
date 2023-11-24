extends PanelContainer
@onready var texture_rect2 = %TextureRect2

var correct_answer : bool = false
var answer_saved: bool = false

signal answer_panel_clicked()

func _ready():
	pass
	



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
			%TextureRect2.show()
			await get_tree().create_timer(1.0).timeout
			M_S.update_test_panel.emit()
			
			if not answer_saved:
				if correct_answer:
					M_S.test_correct_answer_pressed.emit()
				answer_saved=true
				
				
		#if not event.pressed and just_pressed and event.position.distance_to(prev_pos) < threshold:
		#	just_pressed = false
		#	emit_signal("answer_panel_clicked")
	
func setlabell(labelKanji:String,labelHiragana:String,labelEnglish:String)->void:
	$MainLabel1.text = labelKanji
	$MainLabel2.text = labelHiragana
	$MainLabel3.text = labelEnglish
	$MainLabel1.type = "Kanji"
	$MainLabel2.type = "Hiragana"
	$MainLabel3.type = "English"

