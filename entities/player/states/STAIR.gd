extends State


func enter():
	parent.playback.travel("IDLE")
	parent.motion.x = 0

func processPhysics(_delta):
	parent.gravity()
	parent.motion.y = Input.get_axis("ui_up", "ui_down") * parent.VELOCITY

func processState():
	
	if Input.is_action_just_pressed("jump"):
		return "JUMP"
	
	elif not parent.onStair:
		return "FALL"
	
	return null

func exit():
	parent.motion.y = 0
