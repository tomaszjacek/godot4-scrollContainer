extends Control

#signal toppanel_button_pressed(panelName:String)
signal sunmoon_button_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func print_dupa() ->void:
	print("print_dupa")


func _on_import_button_pressed():
	M_S.toppanel_button_pressed.emit("DefineJobPanel")
#	pass # Replace with function body.



func _on_main_menu_button_pressed():
	M_S.toppanel_button_pressed.emit("MainPanel")
#	pass # Replace with function body.


func _on_sun_moon_mode_button_pressed():
	#M_S.toppanel_button_pressed.emit("ChaptersPanel")
	if Global.hiragana_visible:
		Global.hiragana_visible = false
	else:
		Global.hiragana_visible = true
		
	if Global.test_answer_mode != "Hiragana":
		Global.test_answer_mode = "Hiragana"
		Global.test_question_mode = "Kanji"
	else:
		Global.test_answer_mode = "English"
		Global.test_question_mode = "Kanji"
		
	print("Global.hiragana_visible ",Global.hiragana_visible)
	M_S.switch_hiragana.emit()
	M_S.change_test_type.emit()
#	pass # Replace with function body.


func _on_change_learn_button_pressed():
	if Global.learn_type == "English":
		Global.learn_type = "Kanji"
	else:
		Global.learn_type = "English"
	
	if Global.test_question_mode == "English":
		Global.test_question_mode = "Kanji"
		Global.test_answer_mode = "English"
	else:
		Global.test_question_mode = "English"
		Global.test_answer_mode = "Kanji"
			
	M_S.change_learn_type.emit()
	M_S.change_test_type.emit()
