extends Node2D

var test_var = "hello"
var BATCH_SIZE = 100
var dataPath:String = ""
var file_grabbed:String = ""
var job_grabbed = ""
var part_grabbed = ""
var hiragana_visible:bool = true 
var Encode_Data_File:bool=false
# Called when the node enters the scene tree for the first time.


var dictJobs:Dictionary = {}
var dictFilesStats:Dictionary = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("GlobalVariables")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func saveObject() -> Dictionary:
	var rdict := {
		"filepath": get_path(),
		"savedDictJobsToText": var_to_str(dictJobs),
		"savedFilesStats": var_to_str(dictFilesStats),
		"savedDataPath": dataPath
	}
	return rdict

func loadObject(loadedDict: Dictionary) -> void:
	dictJobs = str_to_var(loadedDict.savedDictJobsToText)
	dictFilesStats = str_to_var(loadedDict.savedFilesStats)
	dataPath = loadedDict.savedDataPath

func add_job(hash_job_name:String,job:Dictionary) -> void:
	var tmp : Dictionary = job
	dictJobs[hash_job_name] = tmp

func get_job(hash_job_name:String) -> Dictionary:
	var job:Dictionary = dictJobs[hash_job_name]
	return job

func list_jobs(text:String)->void:
	print("--------",text, "-----------")
	print(dictJobs.keys())
	print("-------------------")

func calc_range(nwords:float,nparts:float,part:float) -> Array:
	var range:Array = []
	var step :float = ceil(nwords/nparts)
	var first:int =  (step*(part-1))+1
	var last:int = (step*(part-1)) + step
	if last > nwords:
		last=nwords
	range.append(first)
	range.append(last)
	return range
