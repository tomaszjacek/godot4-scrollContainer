extends Control


@onready var dict_name_label = $%DictNameLabel
@onready var info_label = %InfoLabel
@onready var info_label_2 = %InfoLabel2
var localHash:String =""
# Called when the node enters the scene tree for the first time.
func set_textt(hash:String,dictName: String, n_p:String,n_r:String, s_date:String) -> void:
	dict_name_label.text = "dict: "+dictName
	var nDays : int= int(n_p) * int(n_r)
	var mod:String = "strict"
	info_label.text = "parts: "+n_p+ " | repetitions: "+n_r+" | nDays: " + str(nDays)+ " |mod: "+ mod
	info_label_2.text = s_date
	localHash = hash


func _on_gui_input(event):
	
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_MASK_RIGHT) \
			and event.is_pressed():
		Global.job_grabbed = localHash
		M_S.job_pressed.emit()
		print("job.gd _on_gui_selected",localHash)
	
