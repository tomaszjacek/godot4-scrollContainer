extends Control

@onready var folders_v_box_container_2 = %foldersVBoxContainer2

var pinned = [
	["Documents", OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)],
	["Desktop", OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)],
	["Downloads", OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS)],
	["Pictures", OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)],
	["Movies", OS.get_system_dir(OS.SYSTEM_DIR_MOVIES)]
]

var path:String = ""
var file :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.dataPath == "":
		path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/"
		#path  = "/storage/emulated/0/Android/data/org.godotengine.scrollcontainer/files/"
	else:
		path = Global.dataPath
	
	set_layout()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_folder(folder_name:String):
	if file:
		path = path.get_base_dir()
	path = path + "/" + folder_name
	set_layout()


func set_layout():
	file = false
	$%Npath.text = path
	for i in folders_v_box_container_2.get_children(): i.queue_free()
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			var nBut = Button.new()
			nBut.text = file_name
			folders_v_box_container_2.add_child(nBut)
			nBut.pressed.connect(open_folder.bind(file_name))
			nBut.add_theme_stylebox_override("normal", load("res://images/folder_box.tres"))
			nBut.clip_text = true
		file_name = dir.get_next()

func _on_up_pressed():
	if file: path = path.get_base_dir()
	path = path.get_base_dir()
	set_layout()

func _on_addf_pressed():
	for i in folders_v_box_container_2.get_children(): i.queue_free()
	Global.dataPath = $%Npath.text + "/"
	M_S.save_requested.emit("GlobalVariables")
	M_S.show_files.emit()
