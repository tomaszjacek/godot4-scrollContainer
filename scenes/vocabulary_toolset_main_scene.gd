extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().on_request_permissions_result
	
	M_S.load_requested.emit("GlobalVariables")
	Global.list_jobs("vocabulary_toolset_main_scene")
	if Global.Encode_Data_File:
		M_S.save_requested.emit("GlobalVariables")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
