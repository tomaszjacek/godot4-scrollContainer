extends Label
var type:String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	M_S.change_test_type.connect(global_test_type_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func global_test_type_changed()->void:
	if Global.test_answer_mode == type:
		self.show()
	else:
		self.hide()

func set_type(new_type:String)->void:
	type=new_type
