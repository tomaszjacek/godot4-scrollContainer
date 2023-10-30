extends Node2D


func _ready():
	pass
	#var move_tween  = create_tween()
	#move_tween.tween_property($VBoxContainer,"position",Vector2(0,-100),1)
	
func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property($VBoxContainer,"position",target,1)


func _on_button_start_pressed():
	print(Global.test_var)
	var target_position = Vector2(-567,450)
	move(target_position)
	get_node("FilesMenu").move(Vector2(0,0))
	#pass # Replace with function body.
