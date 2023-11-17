extends Control
@onready var chapter = preload("res://scenes/chaptersPanel/chapter.tscn")
@onready var grid_container = %GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.part_pressed.connect(part_selected)
	M_S.update_chapter_panel.connect(update)
	#update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func update()->void:
	for child in grid_container.get_children():
		child.queue_free()
	var new_job = Global.dictJobs[Global.job_grabbed]
	var file_name:String =	new_job["file_name"]
	var n_parts:int = new_job["job_n_parts"]
	var n_reps:int = new_job["job_n_repetitions"]
	for x in range(1,n_parts+1):
		var new_chapter = chapter.instantiate()
		grid_container.add_child(new_chapter)
		new_chapter.set_values(x)

func part_selected()->void:

	M_S.update_exam_panel.emit()
	M_S.toppanel_button_pressed.emit("ExamPanel")
