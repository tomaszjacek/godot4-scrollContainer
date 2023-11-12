extends HSlider

signal nparts_selected()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_value_changed(value):
	nparts_selected.emit()
	print("nparts_selected")
