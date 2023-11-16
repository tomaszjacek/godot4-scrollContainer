extends RefCounted

const M_C = preload("res://scripts/module_constants.gd")
const M_F_C = preload("res://scripts/module_file_compiler.gd")

static func Print_File(filePath:String) -> void:
	var text:String = FileAccess.open(filePath,FileAccess.READ).get_as_text()
	print(text)

static func list_file_data() -> Array:
	var file_list_array: Array = []
	for file in DirAccess.get_files_at(M_C.PATH_FOLDER_DATA):
		if file.ends_with(M_C.FORMAT_DATA):
			file_list_array.append(file)
	return file_list_array

static func Print_All_Files_In_Folder(filePathFolder:String) -> void:
	for file in DirAccess.get_files_at(filePathFolder):
		Print_File(filePathFolder + file)

static func Save_Text_File(filePathAndName:String,text:String) -> void:
	var file:FileAccess = FileAccess.open(filePathAndName,FileAccess.WRITE)
	file.store_string(text)
	file.close()
	
static func File_Exists(path:String) -> bool:
	if FileAccess.file_exists(path):return true
	printerr("MODULE_FILE_MANAGER: File does not exists! path:", path)
	return false
	
static func Encode_Data_File(filePath:String,file:String) -> void:
	print("Encode_Data_File _01")
	if !File_Exists(filePath+file):return
	print("Encode_Data_File _02")
	var load_file_data:String = FileAccess.open(filePath+file,FileAccess.READ).get_as_text()
	print("Encode_Data_File _03 ", file)
	var save_file_path:String = M_C.PATH_FOLDER_DATA + file.replace(M_C.FORMAT_CSVDATA,M_C.FORMAT_DATA)
	print("Encode_Data_File _04 ", save_file_path)
	var encoded_text = M_F_C.encode_data_to_string(load_file_data)
	Save_Text_File(save_file_path,encoded_text)
	
	var store_file_name = file.replace(M_C.FORMAT_CSVDATA,"")
	var clean_data:PackedStringArray = load_file_data.split("\r\n")
	Global.dictFilesStats[store_file_name] = clean_data.size()
	print("Global.dictFilesStats[store_file_name]: ",Global.dictFilesStats[store_file_name])
	Global.Encode_Data_File = true
	
static func Load_Text_File(fileName:String) -> String:
	var text:String = FileAccess.open(fileName,FileAccess.READ).get_as_text()
	return text


