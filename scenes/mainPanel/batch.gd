extends Control

signal button_file_pressed(fileName:String)
@onready var batch_name_label = $%BatchNameLabel


# Called when the node enters the scene tree for the first time.
func set_textt(label: String) -> void:
	batch_name_label.text = label




func _on_gui_input(event):
	button_file_pressed.emit(batch_name_label.text)
