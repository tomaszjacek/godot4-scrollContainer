extends Control
@onready var main_panel = $%MainPanel
#@onready var exam_panel = $%ExamPanel
@onready var learn_panel = %LearnPanel

@onready var chapters_panel = $%ChaptersPanel
@onready var define_job_panel = $%DefineJobPanel
@onready var job_config = $%JobConfig
@onready var test_panel = %TestPanel

var chapter_data: ChapterData
var panel_on_screen = "MainPanel"

func _ready():
	M_S.toppanel_button_pressed.connect(show_ui_panel)
	#main_panel.file_menu_selected.connect(file_selected)
	main_panel.show()
	learn_panel.hide()
	test_panel.hide()
	chapters_panel.hide()
	define_job_panel.hide()
	job_config.hide()
	chapter_data = ChapterData.new()
	define_job_panel.file_to_load_selected.connect(show_ui_panel)
	#var move_tween  = create_tween()
	#move_tween.tween_property($VBoxContainer,"position",Vector2(0,-100),1)
	
func show_ui_panel(selectedPanelName:String)->void:
	for p in self.get_children():
		if p.name == selectedPanelName and not p.visible :
			if selectedPanelName == "JobConfig":
				job_config.loadfilename()
			p.show()
		else:
			p.hide()

#func move(nodeName:String,target:Vector2):
#	var move_tween  = create_tween()
#	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
#	var nodeRef = get_node(nodeName)
#	move_tween.tween_property(nodeRef,"position",target,1)


#func _on_button_start_pressed():
#	move("StartMenu",Vector2(-1080,960))
#	move("MainPanel",Vector2(0,0))
#	#pass # Replace with function body.


func file_selected(fileName:String) ->void:
	print("from menubutton %s ",fileName)
	var fileNameWithPath = Global.dataPath + fileName
	chapter_data.readFile(fileNameWithPath)
	#!!! main panel to jest load panel zmien to jutro. na gorze albo w konfigach pole do wpisania sciezki z ktorej bedzie pobieral pliki.
	#!!!i button reload.  po kliknieciu jakiegos pliku wjezdza panel konfiguracji na nim ustawia sie ile procent ma zajmowac chapter i jak dlugo beda trwaly powtorki
	#!!!joba albo jakos inaczej to nazwjij qest
	#!!! tutaj trzeba uaktualnic chapterinventory i odpalic chapter panel
	
	#exam_panel.update(chapter_data)
	#move("StartMenu",Vector2(-2160,960))
	#move("MainPanel",Vector2(-1080,0))
	#move("LearnPanel",Vector2(0,0))
	
