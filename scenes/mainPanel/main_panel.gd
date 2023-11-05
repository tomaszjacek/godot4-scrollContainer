extends Control
@onready var v_box_container = $ScrollContainer/VBoxContainer

signal file_menu_selected(fileName:String)

var dynamicBtMainPanel = preload("res://scenes/mainPanel/batch.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var path = "H://download/testVocab/"
	dir_contents(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func dir_contents(path):
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
					var b = dynamicBtMainPanel.instantiate()
					#b.rect_min_size(Vector2(576,80))
					v_box_container.add_child(b)
					b.set_textt(file_name)
					b.button_file_pressed.connect(work_file_selected)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property(self,"position",target,1)


func work_file_selected(fileName:String)->void:
	#print("work_file_selected _01:", fileName)
	file_menu_selected.emit(fileName)
