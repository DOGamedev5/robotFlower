extends KinematicBody2D

export var powerType : Resource

var motion := Vector2.ZERO
const MAXGRAVITY := 400

func _ready():
	if powerType:
		$RedPower.texture = powerType.texture

func _physics_process(_delta):
	if not is_on_floor():
		motion.y += 10
		if motion.y > MAXGRAVITY:
			motion.y = MAXGRAVITY
	else:
		motion.y = 0
	
	motion.y = move_and_slide(motion, Vector2.UP).y

func updateTexture():
	$RedPower.texture = powerType.texture

