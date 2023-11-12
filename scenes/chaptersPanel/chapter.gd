extends Control
@onready var info_1_label = %Info1Label
@onready var info_2_label = %Info2Label

var localPart:int=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_values(part:int)->void:
	var new_job = Global.get_job(Global.job_grabbed)
	var nRows = Global.dictFilesStats[new_job["file_name"]]
	var n_p:int  = new_job["job_n_parts"]
	var n_r:int  = new_job["job_n_repetitions"]
	var n_words :int = nRows/n_p
	info_1_label.text = "PART " + str(part)
	info_2_label.text = "words" + str(n_words)
	localPart=part
	
func _on_gui_input(event):
	
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_MASK_RIGHT) \
			and event.is_pressed():
		Global.part_grabbed = localPart
		M_S.part_pressed.emit()
		print("chapter.gd _on_gui_selected",localPart)
