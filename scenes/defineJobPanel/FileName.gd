extends Label

var fileName:String=""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setFileName(f:String)->void:
	fileName = f
	print("setFileName...",f)

func getFileName()->String:
	print("getFileName...",fileName)
	return fileName
