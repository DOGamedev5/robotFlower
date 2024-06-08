extends State


func enter():
	parent.motion.y = parent.JUMPFORCE
	parent.playback.travel("JUMP")

func processPhysics(_delta):
	parent.gravity()
	parent.motion.x = Input.get_axis("ui_left", "ui_right") * parent.VELOCITY

func processState():
	if parent.motion.y > 0:
		return "FALL"
	
	elif parent.is_on_floor():
		if Input.get_axis("ui_left", "ui_right"):
			return "WALK"
			
		return "IDLE"
	
	return null
