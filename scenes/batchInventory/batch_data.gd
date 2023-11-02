extends Node2D
class_name BatchData

var fileName: String = ""
var pathName: String = ""

@export var texture: AtlasTexture

var dataDictionary = []
var headers = []
var columnNameId = {}

func readFile(fileNameWithPath:String) -> void:
	#var csv =[]
	#var file = File.new()
	var file =  FileAccess.open(fileNameWithPath, FileAccess.READ)
	while !file.eof_reached():
		var csv_rows = file.get_csv_line("\t") # I use tab as delimiter
		dataDictionary.append(csv_rows)
	file.close()
	dataDictionary.pop_back() #remove last empty array get_csv_line() has created 
	headers = dataDictionary[0]
	for label in headers:
		var column_name_id = headers.find(label)
		columnNameId[label] = column_name_id

