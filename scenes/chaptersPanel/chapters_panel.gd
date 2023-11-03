extends Control
@onready var chapter = preload("res://scenes/chaptersPanel/chapter.tscn")
@onready var grid_container = $ScrollContainer/VBoxContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 10:
		var new_chapter = chapter.instantiate()
		grid_container.add_child(new_chapter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
