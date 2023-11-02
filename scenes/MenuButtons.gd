extends Control
@onready var files_menu = $FilesMenu
@onready var exam_panel = $ExamPanel

var batch_data: BatchData

func _ready():
	files_menu.file_menu_selected.connect(file_selected)
	batch_data = BatchData.new()
	
	#var move_tween  = create_tween()
	#move_tween.tween_property($VBoxContainer,"position",Vector2(0,-100),1)
	
func move(nodeName:String,target:Vector2):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	var nodeRef = get_node(nodeName)
	move_tween.tween_property(nodeRef,"position",target,1)


func _on_button_start_pressed():
	move("StartMenu",Vector2(-1080,960))
	move("FilesMenu",Vector2(0,0))
	#pass # Replace with function body.


func file_selected(fileName:String) ->void:
	print("from menubutton %s ",fileName)
	var fileNameWithPath = Global.dataPath + fileName
	batch_data.readFile(fileNameWithPath)
	exam_panel.update(batch_data)
	move("StartMenu",Vector2(-2160,960))
	move("FilesMenu",Vector2(-1080,0))
	move("ExamPanel",Vector2(0,0))
	
