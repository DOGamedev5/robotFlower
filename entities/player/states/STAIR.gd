extends State


func enter():
	parent.playback.travel("STAIR")
	parent.motion.x = 0

func processPhysics(_delta):
	parent.gravity()
	parent.motion.y = Input.get_axis("ui_up", "ui_down") * parent.VELOCITY
	parent.motion.x = Input.get_axis("ui_left", "ui_right") *  parent.VELOCITY / 2
	
	if not parent.motion:
		parent.playback.travel("STAIRSTOP")
	else:
		parent.playback.travel("STAIR")

func processState():
	
	if parent.jumpBuffer:
		parent.canJump = true
		return "JUMP"
	
	elif not parent.onStair:
		parent.motion.y = 0
		return "FALL"
	
	return null


