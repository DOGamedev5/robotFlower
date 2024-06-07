extends State


func enter():
	pass

func processPhysics(_delta):
	parent.gravity()
	parent.motion.x = Input.get_axis("ui_left", "ui_right") * parent.VELOCITY

func processState():
	if not Input.get_axis("ui_left", "ui_right"):
		return "IDLE"
		
	elif Input.is_action_just_pressed("jump"):
		return "JUMP"
	
	return null

