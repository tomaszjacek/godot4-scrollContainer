extends Control

@onready var top_panel = $TopPanel
@onready var menu_buttons = $MenuButtons
@onready var bottom_panel = $BottomPanel


# Called when the node enters the scene tree for the first time.
func _ready():
	top_panel.print_dupa()
	top_panel.toppanel_button_pressed.connect(menu_buttons.show_ui_panel)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
