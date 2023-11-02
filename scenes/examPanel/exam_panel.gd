extends Control


#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid
@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var slot = preload("res://scenes/examPanel/slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	for n in 10:
#		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
#		v_box_container.add_child(new_slot)
		


func update(data:BatchData) -> void:
	print("UPDATING!!!!!!!!!!!!")
	for child in v_box_container.get_children():
		child.queue_free()

	
	for n in 10:
		#var slot = preload("res://scenes/examPanel/slot.tscn")
		var new_slot = slot.instantiate()
		var question : String = data.dataDictionary[n][data.columnNameId["Kanji"]]
		var answer : String = data.dataDictionary[n][data.columnNameId["English"]]
		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		v_box_container.add_child(new_slot)
		new_slot.set_question_panel_label(question)
		new_slot.set_answer_panel_label(answer)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
