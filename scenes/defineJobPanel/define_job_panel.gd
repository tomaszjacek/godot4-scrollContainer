extends Control


@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var data_path_line_edit = $ScrollContainer/VBoxContainer/HBoxContainer/DataPathLineEdit
@onready var download_button = $ScrollContainer/VBoxContainer/HBoxContainer/DownloadButton
@onready var dynamicBtLoadPanel = preload("res://scenes/defineJobPanel/ButtonLoadPanel.tscn")


signal file_to_load_selected(fileName:String)

# Called when the node enters the scene tree for the first time.
func _ready():
	show_stored_dicts()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_stored_dicts():
	var dicts_list:Array = Globals.M_F_M.list_file_data()
	
	for file in dicts_list:
		var file_name:String = file.replace(Globals.M_C.FORMAT_DATA,"")
		#print("Found file: " + file_name)
		var b = dynamicBtLoadPanel.instantiate()
		b.set_textt(file_name)
		b.buttonload_file_pressed.connect(work_file_selected)
		#b.rect_min_size(Vector2(576,80))
		v_box_container.add_child(b)

		
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property(self,"position",target,1)


func work_file_selected(fileName:String)->void:
	Global.file_grabbed = fileName
	file_to_load_selected.emit("JobConfig")


func _on_download_button_pressed():
	show_stored_dicts()
