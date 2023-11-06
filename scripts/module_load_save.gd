extends Resource
class_name LoadSaveGame


@export var job_datas: Array[JobData]

const SAVE_GAME_PATH := "user://save.tres"


func savegame() -> void :
	ResourceSaver.save(SAVE_GAME_PATH,self)
	
func loadgame() -> void :
	if ResourceSaver.exists(SAVE_GAME_PATH):
		return ResourceSaver.load(SAVE_GAME_PATH)
	return null
