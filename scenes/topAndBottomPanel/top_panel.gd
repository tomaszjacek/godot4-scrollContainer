extends Control

signal toppanel_button_pressed(panelName:String)
signal sunmoon_button_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func print_dupa() ->void:
	print("print_dupa")


func _on_import_button_pressed():
	toppanel_button_pressed.emit("ImportPanel")
#	pass # Replace with function body.



func _on_main_menu_button_pressed():
	toppanel_button_pressed.emit("MainMenu")
#	pass # Replace with function body.


func _on_sun_moon_mode_button_pressed():
	sunmoon_button_pressed.emit()
#	pass # Replace with function body.
