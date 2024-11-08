extends State

onready var jumpSfx = preload("res://audio/sfx/jump.wav")

func enter():
	parent.playback.travel("JUMP")
	AudioManager.playEffect(jumpSfx)

func processPhysics(_delta):
	parent.gravity()
	parent.motion.x = Input.get_axis("ui_left", "ui_right") * parent.VELOCITY
	
	parent.jump()
	

func processState():

	if parent.motion.y > 0:
		return "FALL"
	
	elif parent.is_on_floor():
		if Input.get_axis("ui_left", "ui_right"):
			return "WALK"
			
		return "IDLE"
	
	elif Input.is_action_pressed("ui_up") and parent.onStair:
		return "STAIR"
	
	return null
