@tool
extends EditorScript
const M_C = preload("res://scripts/module_constants.gd")
const M_F_M = preload("res://scripts/module_file_manager.gd")
const M_F_C = preload("res://scripts/module_file_compiler.gd")

var gamedata:Dictionary = {}

func _run():
	print("Hello from the Godot Editor!")
	#M_F_M.Print_All_Files_In_Folder(M_C.PATH_FOLDER_DATA)
	M_F_C.compile_csvdata_files()
	var currentFile:String = "vocabN5_notatnik_UTF-8.data"
	M_F_C.give_me_file_as_dictionary(currentFile, gamedata)
	print("\n\n------------------------------------------------------------\n\n")
	print(gamedata[668])

