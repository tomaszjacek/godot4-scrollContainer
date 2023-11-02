extends Control


@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2(648,1152,),
	"1280 x 720" : Vector2(720,1280),
	"1920 x 1080" : Vector2(1080, 1920),
	"2400 x 1080" : Vector2(1080,2400)
}

func _ready():
	option_button.item_selected.connect(on_resolution_selectd)
	add_resolution_items()
	
func add_resolution_items() -> void:
	for resolution_mode in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_mode)
		
func on_resolution_selectd(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	#DisplayServer.screen_set_orientation(DisplayServer.SCREEN_PORTRAIT,true)
