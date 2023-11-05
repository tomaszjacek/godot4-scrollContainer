extends Node

const M_C = preload("res://scripts/module_constants.gd")
const M_F_M = preload("res://scripts/module_file_manager.gd")
const M_F_C = preload("res://scripts/module_file_compiler.gd")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#M_F_M.Print_All_Files_In_Folder(M_C.PATH_FOLDER_DATA)
	M_F_C.compile_csvdata_files()
