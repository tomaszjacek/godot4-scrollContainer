extends Control

#const M_F_C = preload("res://scripts/module_file_compiler.gd")
#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid
@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var slot = preload("res://scenes/learnPanel/slot.tscn")
@onready var finish_button = preload("res://scenes/learnPanel/learning_finished_button.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.update_learn_panel.connect(update)
#	for n in 10:
#		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
#		v_box_container.add_child(new_slot)
		


func update() -> void:
	print("UPDATING!!!!!!!!!!!!")
	for child in v_box_container.get_children():
		child.queue_free()
	var new_job = Global.dictJobs[Global.job_grabbed]
	var file_name:String =	new_job["file_name"]
	var job_dict:Dictionary = {}
	Globals.M_F_C.give_me_file_as_dictionary(file_name+".data",job_dict)
	print(job_dict)
	var n_words:int = new_job["dict_n_words"]
	var n_parts:int = new_job["job_n_parts"]
	var part:int = Global.part_grabbed
	var new_job_range = Global.calc_range(n_words,n_parts,part)
	for n in range(new_job_range[0],new_job_range[1]):
		var new_slot = slot.instantiate()
		var question : String = job_dict[n]["Kanji"]
		var answer : String = job_dict[n]["English"]
#		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		v_box_container.add_child(new_slot)
		new_slot.set_question_panel_label(question)
		new_slot.set_answer_panel_label(answer)
	var b = finish_button.instantiate()
	v_box_container.add_child(b)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


