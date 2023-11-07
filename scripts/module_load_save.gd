extends Resource
class_name LoadSaveGame


@export var job_datas: Array[JobData]

const SAVE_GAME_PATH := "user://save.tres"


func savegame() -> void :
	ResourceSaver.save(self,SAVE_GAME_PATH)
	
func loadgame():
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
