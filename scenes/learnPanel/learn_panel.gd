extends Control

#const M_F_C = preload("res://scripts/module_file_compiler.gd")
#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid
@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var slot = preload("res://scenes/learnPanel/slot.tscn")
@onready var finish_button = preload("res://scenes/learnPanel/learning_finished_button.tscn")
var answers_requested: int = 0
var n_words_local: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.update_learn_panel.connect(update)
	M_S.learn_answer_requested.connect(add_answer_request)
	M_S.learn_finished.connect(learning_finished)
#	for n in 10:
#		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
#		v_box_container.add_child(new_slot)
		

func add_answer_request()->void:
	answers_requested += 1
	
#func learn_panel_init()->void:
	
	
func learning_finished()->void:
	var jobName = Global.job_grabbed
	var partName = Global.part_grabbed
	var results : int = int(((n_words_local-answers_requested)*100)/n_words_local)
	var date : String = str(Time.get_date_string_from_system())
	Global.dictJobs[jobName]["learnHistory"][partName][date]=results
	M_S.save_requested.emit("GlobalVariables")
	
func update() -> void:
	print("UPDATING!!!!!!!!!!!!")
	
	
	answers_requested = 0
	
	for child in v_box_container.get_children():
		child.queue_free()
	var new_job = Global.get_job(Global.job_grabbed)#Global.dictJobs[Global.job_grabbed]
	var file_name:String =	new_job["file_name"]
	var job_dict:Dictionary = {}
	Globals.M_F_C.give_me_file_as_dictionary(file_name+".data",job_dict)
	#print(job_dict)
	var n_words:int = new_job["dict_n_words"]
	var n_parts:int = new_job["job_n_parts"]
	var part:int = Global.part_grabbed
	var new_job_range = Global.calc_range(n_words,n_parts,part)
	#print ("n_words: ",n_words,"range: ",new_job_range)
	n_words_local = new_job_range[1]+1-new_job_range[0]
	
	for n in range(new_job_range[0],new_job_range[1]):
		var new_slot = slot.instantiate()
		var kanji_string : String = job_dict[n]["Kanji"]
		var hiragana_string : String = job_dict[n]["Hiragana"]
		var english_string : String = job_dict[n]["English"]
#		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		v_box_container.add_child(new_slot)
		new_slot.set_question_panel_label(kanji_string,hiragana_string,english_string)
		new_slot.set_answer_panel_label(kanji_string,hiragana_string,english_string)
		if Global.hiragana_visible:
			new_slot.show_hiragana()
	var b = finish_button.instantiate()
	v_box_container.add_child(b)
	M_S.change_learn_type.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


