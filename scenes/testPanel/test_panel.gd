extends Control

#const M_F_C = preload("res://scripts/module_file_compiler.gd")
#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid

@onready var panel_container = %PanelContainer
@onready var grid_container = %GridContainer


@onready var test_answer = preload("res://scenes/testPanel/answer_test_panel.tscn")
@onready var test_question = preload("res://scenes/testPanel/question_test_panel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.update_test_panel.connect(update_test)
	M_S.init_test_panel.connect(init_test)
#	for n in 10:
#		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
#		v_box_container.add_child(new_slot)
		

func init_test() -> void:
	print("UPDATING!!!!!!!!!!!!")
	for child in panel_container.get_children():
		child.queue_free()
	for child in grid_container.get_children():
		child.queue_free()
	var new_question = test_question.instantiate()
	panel_container.add_child(new_question)

	for n in range(1,5):
		var new_answer = test_answer.instantiate()

#		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		grid_container.add_child(new_answer)
		#new_slot.set_question_panel_label(question)
		#new_slot.set_answer_panel_label(answer)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func update_test() -> void:
	print("UPDATING!!!!!!!!!!!!")
	for child in panel_container.get_children():
		child.queue_free()
	for child in grid_container.get_children():
		child.queue_free()
	var new_question = test_question.instantiate()
	panel_container.add_child(new_question)

	for n in range(1,5):
		var new_answer = test_answer.instantiate()

#		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		grid_container.add_child(new_answer)
		#new_slot.set_question_panel_label(question)
		#new_slot.set_answer_panel_label(answer)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass


