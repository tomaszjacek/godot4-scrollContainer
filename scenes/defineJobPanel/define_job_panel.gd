extends Control

@onready var files_v_box_container = %Files_VBoxContainer
@onready var dicts_v_box_container = %Dicts_VBoxContainer
@onready var data_path_line_edit = %DataPathLineEdit

@onready var dynamicBtLoadPanel = preload("res://scenes/defineJobPanel/ButtonLoadPanel.tscn")
@onready var file_panel = preload("res://scenes/defineJobPanel/filesUtils/file_panel.tscn")

signal file_to_load_selected(fileName:String)

var file :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	M_S.show_dicts.connect(show_stored_dicts)
	M_S.show_files.connect(show_stored_files)
	show_stored_files()
	show_stored_dicts()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_stored_files():
	var path:String = Global.dataPath
	file = false

	for i in files_v_box_container.get_children(): i.queue_free()
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir():
			if file_name.ends_with(Globals.M_C.FORMAT_CSVDATA):
				var new_file_panel = file_panel.instantiate()
				files_v_box_container.add_child(new_file_panel)
				new_file_panel.set_file_path(path,file_name)
		file_name = dir.get_next()


func show_stored_dicts():
	var dicts_list:Array = Globals.M_F_M.list_file_data()
	for i in dicts_v_box_container.get_children(): i.queue_free()
	for file in dicts_list:
		var file_name:String = file.replace(Globals.M_C.FORMAT_DATA,"")
		#print("Found file: " + file_name)
		var b = dynamicBtLoadPanel.instantiate()
		#b.rect_min_size(Vector2(576,80))
		dicts_v_box_container.add_child(b)
		b.set_textt(file_name)
		b.buttonload_file_pressed.connect(work_file_selected)

		
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property(self,"position",target,1)


func work_file_selected(fileName:String)->void:
	Global.file_grabbed = fileName
	file_to_load_selected.emit("JobConfig")


