extends GridContainer

@onready var question_panel = $question_panel
@onready var answer_panel = $answer_panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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

func _on_question_panel_gui_input(event):
	if answer_panel.visible:
		hide_answer()
	else:
		show_answer()	
	#show_answer() # Replace with function body.
	#var position_after_slide = Vector2(0,-100)
	#move(position_after_slide) 

		
