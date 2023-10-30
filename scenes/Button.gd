extends Button

signal button_file_pressed(fileName:String)

# Called when the node enters the scene tree for the first time.
func set_textt(label: String) -> void:
	text = label


func _on_pressed():
	button_file_pressed.emit(text)
