extends State


func enter():
	parent.motion.x = 0

func processPhysics(_delta):
	parent.gravity()
	parent.playback.travel("IDLE")

func processState():
	if Input.get_axis("ui_left", "ui_right"):
		return "WALK"
	
	elif Input.is_action_just_pressed("jump"):
		return "JUMP"
	
	elif not parent.is_on_floor():
		return "FALL"
	
	elif Input.is_action_just_pressed("ui_up") and parent.onStair:
		return "STAIR"
	
	return null

func exit():
	pass
