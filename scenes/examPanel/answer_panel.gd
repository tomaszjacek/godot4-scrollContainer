extends PanelContainer

signal answer_panel_clicked()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_question_panel_gui_input(event):
#	pass # Replace with function body.
func _on_answer_panel_gui_input(event):
#	if answer_panel.visible:
#		hide_answer()
#	else:
#		show_answer()
	
	answer_panel_clicked.emit()
	print("_on_answer_panel_gui_input")
	
