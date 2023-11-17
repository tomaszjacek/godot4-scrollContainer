extends Control
#@onready var label_2 = $GridContainer/Label2
@onready var n_parts = $%NParts
@onready var n_repetitions = $%NRepetitions
@onready var final_info = $%FinalInfo
@onready var warn_info = %WarnInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	n_parts.nparts_selected.connect(nparts_nrepetitions_selected)
	n_repetitions.nrepetitions_selected.connect(nparts_nrepetitions_selected)
	%FileName.text = Global.file_grabbed
	%FileName.setFileName(Global.file_grabbed)
	print("DUPA: ",Global.file_grabbed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func loadfilename()->void:
	$%FileName.text = Global.file_grabbed

func save_job()->void:
	var new_job : Dictionary = {}
	var file_name:String =  Global.file_grabbed#$%FileName.getFileName()
	print("save_job...",file_name)
	new_job["file_name"] = file_name
	new_job["job_n_parts"] = n_parts.value
	new_job["job_n_repetitions"] = n_repetitions.value
	new_job["dic_n_words"] = Global.dictFilesStats[file_name]
	new_job["learnHistory"] = {}
	new_job["testHistory"] = {}
	for n in new_job["job_n_parts"]:
		var tmpDict:Dictionary={}
		new_job["learnHistory"][n] = tmpDict
		var tmpDictt:Dictionary={}
		new_job["testHistory"][n] = tmpDictt
		
	var hash = calc_hash(new_job.file_name,str(new_job.job_n_parts),str(new_job.job_n_repetitions))
	Global.add_job(hash,new_job)
	M_S.save_requested.emit("GlobalVariables")
	warn_info.text = "Job created"
	M_S.show_jobs_signal.emit()
	
func nparts_nrepetitions_selected()->void:
	var nParts: int = n_parts.value
	var nRepetitions: int = n_repetitions.value
	var fName : String = $%FileName.text
	var nRows: int = Global.dictFilesStats[fName]
	var nDays: int = nParts * nRepetitions
	var finalInfo:String = "Vocabulary size is %s words.\nVocabulary divided to %s parts. \n Each part %s times repeated.\n  %s days to finish\n" % [nRows,nParts,nRepetitions,nDays]
	final_info.text = finalInfo
	var hash = calc_hash(fName,str(nParts),str(nRepetitions))
	if Global.dictJobs.has(hash):
		warn_info.text = "Job with such parameters already exists"
	else:
		warn_info.text = ""
	#print(finalInfo)

func calc_hash(str1:String,str2:String,str3:String)->String:
	var tmpString = str1+str2+str3
	return tmpString.sha256_text()
