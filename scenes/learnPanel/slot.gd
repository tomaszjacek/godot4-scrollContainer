extends TabContainer

@onready var question_panel = $question_panel
@onready var answer_panel = $answer_panel

# Called when the node enters the scene tree for the first time.
func _ready():
	answer_panel.answer_panel_clicked.connect(change_tab)
	question_panel.question_panel_clicked.connect(change_tab)
	M_S.switch_hiragana.connect(show_hiragana)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_answer()->void:
	answer_panel.hide()
	
func show_answer()->void:
	answer_panel.show()
	
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property($answer_panel,"position",target,1)


func set_question_panel_label(main:String,help:String)->void:
	question_panel.setlabell(String(main),String(help))

	

func set_answer_panel_label(main:String,help:String)->void:
	answer_panel.setlabell(String(main),String(help))

	
	#var position_after_slide = Vector2(0,-100)
	#move(position_after_slide) 
func show_hiragana()->void:
	question_panel.hiragana()
	answer_panel.hiragana()

func change_tab() ->void:
	if answer_panel.visible:
		#hide_answer()
		set_current_tab(0)
	else:
		set_current_tab(1)
		#show_answer()
	print("change_tab %s ",current_tab)
	
	#question_panel.setlabell("dupa")
#func _on_tab_clicked(tab):
#	slot_clicked.emit(tab)

