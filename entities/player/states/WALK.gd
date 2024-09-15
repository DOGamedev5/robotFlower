extends State


func enter():
	parent.playback.travel("WALK")

func processPhysics(_delta):
	parent.gravity()
	parent.motion.x = Input.get_axis("ui_left", "ui_right") * parent.VELOCITY

func processState():
	if not Input.get_axis("ui_left", "ui_right"):
		return "IDLE"
		
	elif parent.jumpBuffer and parent.canJump:
		return "JUMP"
	
	elif Input.is_action_just_pressed("ui_up") and parent.onStair:
		return "STAIR"
	
	elif parent.motion.y > 0 and not parent.is_on_floor():
		return "FALL"
	
	return null

