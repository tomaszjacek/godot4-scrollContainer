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
				M_F_M.Encode_Data_File(M_C.PATH_FOLDER_DATA + file, file)
			else:
				print("M_F_C: juz taki plik data jest ",M_C.PATH_FOLDER_DATA +save_file_path)


static func build_data_dictionaries(dictionaries:Dictionary) -> void:
	var dict_names:Array = dictionaries.keys()
	var dict_values:Array = dictionaries.values()
	

static func give_me_file_as_dictionary(fileName:String,dict:Dictionary)->void:
	var encoded_data:String = M_F_M.Load_Text_File(M_C.PATH_FOLDER_DATA + fileName)
	var decoded_data:String = decode_data_to_string(encoded_data)
	var clean_data:PackedStringArray = decoded_data.split("\r\n")
	data_parse_CSV(clean_data,dict)
	#print("\n\n----------!\n",dict[668],"\n--------!\n\n")
	
	
	
	
static func data_parse_CSV(all_csv_lines:PackedStringArray,stored_csv_dict:Dictionary) -> void:
	#stored_csv_dict: Dictionary = {}
	if all_csv_lines.size()>1:
		var csv_headers_processed:bool = false
		var csv_line_headers:Array=[]
		var lineNumber:int = 1
		for csv_line in all_csv_lines:
			if !csv_line.is_empty():
				var first_cell:String = csv_line[0]
				if(!first_cell.begins_with("#") and 
					first_cell != ";" and 
					first_cell !=""
				):
					#print("M_F_C: processing valid csv line :", csv_line)
					var csv_splitted_data:PackedStringArray = csv_line.split("\t")
					print("SPLITEDDATA",csv_splitted_data)
					if !csv_headers_processed:
						var i:int = 0
						for header in csv_splitted_data:
							csv_line_headers.append(csv_splitted_data[i])
							print("header ",i,"|",csv_splitted_data[i])
							i += 1
						print("CSVLINEHEADERSARRAY",csv_line_headers)
						csv_headers_processed = true
					else:
						#var entry_id = str_to_var(csv_splitted_data[0])
						var csv_i:int = 0
						for csv_data in csv_splitted_data:
							
							if !stored_csv_dict.keys().has(lineNumber):
								stored_csv_dict[lineNumber] = {}
							print("CSV_DATA:::",lineNumber,"|",csv_data," | ",csv_line_headers[csv_i])
							stored_csv_dict[lineNumber][ csv_line_headers[csv_i] ] = csv_data
							#print(str_to_var(csv_data))
							csv_i += 1
			lineNumber += 1
	
	#return stored_csv_dict

