@tool
extends EditorScript
const M_C = preload("res://scripts/module_constants.gd")
const M_F_M = preload("res://scripts/module_file_manager.gd")
const M_F_C = preload("res://scripts/module_file_compiler.gd")

var gamedata:Dictionary = {}

func _run():
#	print("Hello from the Godot Editor!")
#	M_F_M.Print_All_Files_In_Folder(M_C.PATH_FOLDER_DATA)
#	M_F_C.compile_csvdata_files()

#	var currentFile:String = "vocabN5_unicode_UTF8.data"
#	M_F_C.give_me_file_as_dictionary(currentFile, gamedata)
#	print("\n\n------------------------------------------------------------\n\n")
#	print(gamedata[668])
#	print("\n\n------------------------------------------------------------\n\n")
#	print(Time.get_time_string_from_system())
#	print(prepare_date_time_string(Time.get_datetime_string_from_system()))
	
	var nword:int = 669
	var nparts:int = 5
	var part:int = 3
	
	for z in range (1,nparts+1,1):
		
		var range:Array = calc_range(nword,nparts,z)
		
	print("")
	print("")


func calc_range(nwords:float,nparts:float,part:float) -> Array:
	var range:Array = []
	var step :float = ceil(nwords/nparts)
	var first:int =  (step*(part-1))+1
	var last:int = (step*(part-1)) + step
	if last > nwords:
		last=nwords
		
	print("part: ",part," | ", "step: ",step," | ","first: ",first," | ","last: ",last)

	range.append(first)
	range.append(last)
	return range


func prepare_date_time_string(tmp:String) -> String:
	var return_string:String = "Date: " + tmp.replace("T"," Time: ")
	return return_string
