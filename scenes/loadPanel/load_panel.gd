extends Control

@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var data_path_line_edit = $ScrollContainer/VBoxContainer/HBoxContainer/DataPathLineEdit
@onready var download_button = $ScrollContainer/VBoxContainer/HBoxContainer/DownloadButton
@onready var dynamicBtLoadPanel = preload("res://scenes/loadPanel/ButtonLoadPanel.tscn")

signal file_to_load_selected(fileName:String)

# Called when the node enters the scene tree for the first time.
func _ready():
	var path = "H://download/testVocab/"
	data_path_line_edit.text = path
	dir_contents()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func dir_contents():
	var path = data_path_line_edit.text
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:

				var ext = file_name.get_extension()
				if ext == "txt":
					#print("Found file: " + file_name)
					var b = dynamicBtLoadPanel.instantiate()
					b.set_textt(file_name)
					b.buttonload_file_pressed.connect(work_file_selected)
					#b.rect_min_size(Vector2(576,80))
					v_box_container.add_child(b)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property(self,"position",target,1)


func work_file_selected(fileName:String)->void:
	Global.file_grabbed = fileName
	file_to_load_selected.emit("BatchConfig")


func _on_download_button_pressed():
	dir_contents()
