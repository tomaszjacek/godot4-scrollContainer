extends Control


func _ready():	
	print("SAVE_LOAD_MODULE _READY")
	M_S.load_requested.connect(_load)
	M_S.save_requested.connect(_save)
	_load("GlobalVariables")
	if Global.dataPath == "":
		Global.dataPath = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
		#Global.dataPath  = "/storage/emulated/0/Android/data/org.godotengine.scrollcontainer/files/testVocab/"
		
func _save(group_name:String) -> void:
	
	var destination_name = Globals.M_C.PATH_FOLDER_DATA + group_name + "_saveFile"
	print("_SAVING.....",destination_name)
	var save_file = FileAccess.open(destination_name, FileAccess.WRITE) # Open File

	# Go through every object in the SaveLoad group
	var save_nodes = get_tree().get_nodes_in_group(group_name)
	for node in save_nodes:
		# Check if the node has a save function.
		if !node.has_method("saveObject"):
			print("Node '%s' is missing a save function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("saveObject")

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(JSON.stringify(node_data))

		save_file.close() # Close File
	print("_SAVING.....END")
	
func _load(group_name:String) -> void:
	
	var destination_name = Globals.M_C.PATH_FOLDER_DATA  + group_name + "_saveFile"
	print("_LOADING.....",destination_name)
	# Check if the SaveFile exists
	if !FileAccess.file_exists(destination_name):
		print("Error, no Save File to load.| destination_name",destination_name)
		return

	var save_file = FileAccess.open(destination_name, FileAccess.READ) # Open File

	while save_file.get_position() < save_file.get_length():
		# Get the saved dictionary from the next line in the save file
		var json = JSON.new()
		json.parse(save_file.get_line())

		# Get the Data
		var node_data = json.get_data()
		if has_node(node_data["filepath"]):
			get_node(node_data["filepath"]).loadObject(node_data)
			
	save_file.close()
	print("_LOADING.....END")
