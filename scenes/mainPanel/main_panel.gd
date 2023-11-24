extends Control
@onready var v_box_container = $ScrollContainer/VBoxContainer

#signal file_menu_selected(fileName:String)

var dynamicBtMainPanel = preload("res://scenes/mainPanel/job.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	#var path = "H://download/testVocab/"
	M_S.job_pressed.connect(job_selected)
	M_S.show_jobs_signal.connect(show_jobs)
	show_jobs()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_jobs():
	for i in v_box_container.get_children(): i.queue_free()
	Global.list_jobs("main_panel")
	var jobList:Array = Global.dictJobs.keys()
	print("SHOW_JOBS ",jobList)
	for jobHash in jobList:
		var new_job:Dictionary ={}
		new_job = Global.get_job(jobHash)
		var b = dynamicBtMainPanel.instantiate()
		#b.rect_min_size(Vector2(576,80))
		v_box_container.add_child(b)
		b.set_textt(jobHash,new_job["file_name"],str(new_job["job_n_parts"]),str(new_job["job_n_repetitions"]),str(new_job["start_date"]))
		#b.button_file_pressed.connect(work_file_selected)

func move(target):
	var move_tween  = create_tween()
	#move_tween.interpolate_property($VBoxContainer,"position",position,target,2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	move_tween.tween_property(self,"position",target,1)


func job_selected()->void:
	#print("work_file_selected _01:", fileName)
	#file_menu_selected.emit(fileName)
	M_S.update_chapter_panel.emit()
	M_S.toppanel_button_pressed.emit("ChaptersPanel")
