extends RefCounted

const M_C = preload("res://scripts/module_constants.gd")
const M_F_M = preload("res://scripts/module_file_manager.gd")

static func encode_data_to_string(text:String) -> String:
	return Marshalls.utf8_to_base64(text)
	
static func decode_data_to_string(text:String) -> String:
	return Marshalls.base64_to_utf8( text )


static func compile_csvdata_files()-> void:
	for file in DirAccess.get_files_at(M_C.PATH_FOLDER_DATA):
		if file.ends_with(M_C.FORMAT_CSVDATA):
			var save_file_path:String = file.replace(M_C.FORMAT_CSVDATA,M_C.FORMAT_DATA)
			if !M_F_M.File_Exists(M_C.PATH_FOLDER_DATA +save_file_path) :
				print("M_F_C: nie ma takiego pliku - bede kondowal ",M_C.PATH_FOLDER_DATA +save_file_path)
				M_F_M.Encode_Data_File(M_C.PATH_FOLDER_DATA + file)
			else:
				print("M_F_C: juz taki plik data jest ",M_C.PATH_FOLDER_DATA +save_file_path)
