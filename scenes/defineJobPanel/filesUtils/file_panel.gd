extends Control

var file_full_path:String = ""
var file_name:String = ""
@onready var dict_file_label = %dictFile_Label

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#M_S.import_file.connect(_on_importFile_button_pressed)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_importFile_button_pressed():
	Globals.M_F_C.compile_csvdata_file(file_full_path,file_name)
	
	var file_name1 = file_name.replace(".txt",".data")
	var dict_length = Globals.M_F_C.get_dictionary_length(file_name1)
	var file_name2 = file_name1.replace(".data","")
	Global.dictFilesStats[file_name2] = dict_length
	M_S.show_dicts.emit()

func set_file_path(path:String,fileName:String)->void:
	file_full_path = path
	file_name = fileName
	dict_file_label.text = fileName
