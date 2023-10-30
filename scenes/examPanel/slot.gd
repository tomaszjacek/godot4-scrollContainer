extends TabContainer

@onready var question_panel = $question_panel
@onready var answer_panel = $answer_panel



# Called when the node enters the scene tree for the first time.
func _ready():
	answer_panel.answer_panel_clicked.connect(change_tab)
	question_panel.question_panel_clicked.connect(change_tab)



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



	
	
	#var position_after_slide = Vector2(0,-100)
	#move(position_after_slide) 

		

func change_tab() ->void:
	if answer_panel.visible:
		#hide_answer()
		set_current_tab(0)
	else:
		set_current_tab(1)
		#show_answer()
	print("change_tab %s ",current_tab)

#func _on_tab_clicked(tab):
#	slot_clicked.emit(tab)

