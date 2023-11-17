extends Button

signal buttonload_file_pressed(file_Name:String)
var fileName:String = ""
# Called when the node enters the scene tree for the first time.
func set_textt(label: String) -> void:
	text = label
	fileName = label
	print("!!!set_textt...",fileName)

func _on_pressed():
	Global.file_grabbed = fileName
	buttonload_file_pressed.emit(fileName)
