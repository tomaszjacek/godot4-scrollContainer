extends Control


#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid
@onready var v_box_container = $ScrollContainer/VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	var slot = preload("res://scenes/examPanel/slot.tscn")
	for n in 10:
		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
		v_box_container.add_child(new_slot)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
