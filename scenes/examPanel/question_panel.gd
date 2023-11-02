extends PanelContainer

signal question_panel_clicked()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#signal show_answer()


#func on_question_clicked() -> void:
#	show_answer.emit()

func _on_question_panel_gui_input(event):
#	if answer_panel.visible:
#		hide_answer()
#	else:
#		show_answer()
	
	question_panel_clicked.emit()
	print("_on_question_panel_gui_input")
	
func setlabell(t:String)->void:
	$Label.text =t
	print(t)	
