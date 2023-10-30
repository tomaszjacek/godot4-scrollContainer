extends Control


@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid


# Called when the node enters the scene tree for the first time.
func _ready():
	var slot = preload("res://scenes/examPanel/slot.tscn")
	for n in 10:
		var new_slot = slot.instantiate()
		#new_slot.hide_answer()
		slots_grid.add_child(new_slot)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
