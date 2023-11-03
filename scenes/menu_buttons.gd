extends Control
@onready var main_panel = $MainPanel
@onready var exam_panel = $ExamPanel
@onready var chapters_panel = $ChaptersPanel

var chapter_data: ChapterData
var panel_on_screen = "MainPanel"

func _ready():
	
	main_panel.file_menu_selected.connect(file_selected)
	main_panel.show()
	exam_panel.hide()
	chapters_panel.hide()
	
	chapter_data = ChapterData.new()
	
	#var move_tween  = create_tween()
	#move_tween.tween_property($VBoxContainer,"position",Vector2(0,-100),1)
	
func show_ui_panel(selectedPanelName:String)->void:
	for p in self.get_children():
		if p.name == selectedPanelName and not p.visible :
			p.show()
		else:
			p.hide()

func move(nodeName:String,target:Vector2):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	var nodeRef = get_node(nodeName)
	move_tween.tween_property(nodeRef,"position",target,1)


func _on_button_start_pressed():
	move("StartMenu",Vector2(-1080,960))
	move("MainPanel",Vector2(0,0))
	#pass # Replace with function body.


func file_selected(fileName:String) ->void:
	print("from menubutton %s ",fileName)
	var fileNameWithPath = Global.dataPath + fileName
	chapter_data.readFile(fileNameWithPath)
	!!! tutaj trzeba uaktualnic chapterinventory i odpalic chapter panel
	
	#exam_panel.update(chapter_data)
	#move("StartMenu",Vector2(-2160,960))
	#move("MainPanel",Vector2(-1080,0))
	#move("ExamPanel",Vector2(0,0))
	
