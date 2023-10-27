extends Control
@onready var v_box_container = $ScrollContainer/VBoxContainer
var dynamicBt = preload("res://button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var path = "H://download/"
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
					print("Found file: " + file_name)
					var b = dynamicBt.instantiate()
					b.set_textt(file_name)
					v_box_container.add_child(b)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
