extends Control

#const M_F_C = preload("res://scripts/module_file_compiler.gd")
#@onready var slots_grid = $ScrollContainer/VBoxContainer/slotsGrid

@onready var panel_container = %PanelContainer
@onready var grid_container = %GridContainer


@onready var test_answer = preload("res://scenes/testPanel/answer_test_panel.tscn")
@onready var test_question = preload("res://scenes/testPanel/question_test_panel.tscn")
var failed_decor:Texture2D = preload("res://scenes/testPanel/answer_failed_decor.tres")
var ok_decor:Texture2D = preload("res://scenes/testPanel/answer_ok_decor.tres")
var test_dict:Dictionary = {}
var index_grabbed:int = 0
var index_last:int = 0
var index_first:int = 0

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.update_test_panel.connect(update_test)
	M_S.init_test_panel.connect(init_test)
#	for n in 10:
#		var new_slot = slot.instantiate()
#		new_slot.answer_panel.answer_panel_clicked.connect(new_slot.change_tab)
#		new_slot.question_panel.question_panel_clicked.connect(new_slot.change_tab)
		
		#new_slot.hide_answer()
#		v_box_container.add_child(new_slot)
		

func init_test() -> void:
	print("UPDATING!!!!!!!!!!!!")
#	for child in panel_container.get_children():
#		child.queue_free()
#	for child in grid_container.get_children():
#		child.queue_free()

	var new_job = Global.get_job(Global.job_grabbed)#Global.dictJobs[Global.job_grabbed]
	var file_name:String =	new_job["file_name"]
	Globals.M_F_C.give_me_file_as_dictionary(file_name+".data",test_dict)
	
	var n_words:int = new_job["dict_n_words"]
	var n_parts:int = new_job["job_n_parts"]
	var part:int = Global.part_grabbed
	var new_job_range = Global.calc_range(n_words,n_parts,part)
	index_first = new_job_range[0]
	index_grabbed = new_job_range[0]
	index_last = new_job_range[1]
	
	update_test()


func update_test() -> void:
	print("UPDATING!!!!!!!!!!!!")
	for child in panel_container.get_children():
		child.queue_free()
	for child in grid_container.get_children():
		child.queue_free()
	var new_question = test_question.instantiate()
	panel_container.add_child(new_question)
	new_question.setlabell(test_dict[index_grabbed]["Kanji"])
	
	randomize()
	#var correct_slot = rng.randf_range(1, 4)
	var correct_slot = int(rng.randf_range(1, 5))
	var bad_indices:Array = get_bad_indices(correct_slot)
	print(index_first," ",index_last," ",index_grabbed)
	print(correct_slot)
	print(bad_indices)
	
	for n in range(1,5):
		
		var new_answer = test_answer.instantiate()
#		print("%s %s %s %s",[question, answer,question.sha256_text(), answer.sha256_text()])
		grid_container.add_child(new_answer)
		new_answer.setlabell(test_dict[bad_indices[n-1]]["Kanji"])
		if n == correct_slot:
			new_answer.texture_rect2.set_texture(ok_decor)
		else:
			new_answer.texture_rect2.set_texture(failed_decor)
		#new_slot.set_question_panel_label(question)
		#new_slot.set_answer_panel_label(answer)
		
	index_grabbed += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.

func get_bad_indices(correct_slot:int) -> Array:
	var out_array:Array=[]
	for n in range(1,5):
		if n == correct_slot:
			out_array.append(index_grabbed)
		else:
			var done:bool=false
			while not done:
				var bad_slot = int(rng.randf_range(index_first, index_last))
				if bad_slot != index_grabbed:
					out_array.append(bad_slot)
					done=true
	return out_array
	
func _process(delta):
	pass


