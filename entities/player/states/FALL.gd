extends State

onready var fallSfx = preload("res://audio/sfx/fall.wav")

func enter():
	parent.playback.travel("JUMP")

func processPhysics(_delta):
	parent.gravity()
	parent.motion.x = Input.get_axis("ui_left", "ui_right") * parent.VELOCITY

func processState():
	if Input.is_action_just_pressed("jump") and parent.canJump:
		return "JUMP"
	
	if parent.is_on_floor():
		if Input.get_axis("ui_left", "ui_right"):
			return "WALK"
			
		return "IDLE"
	
	elif Input.is_action_just_pressed("ui_up") and parent.onStair:
		return "STAIR"
	
	return null

func exit():
	AudioManager.playEffect(fallSfx, 1, 0.6)
