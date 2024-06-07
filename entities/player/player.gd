extends KinematicBody2D

export var cameraLimitsMin := Vector2(-10000000, -10000000)
export var cameraLimitsMax := Vector2(10000000, 10000000)

onready var camera := $Camera2D
onready var stateMachine := $StateMachine

const VELOCITY := 300
const GRAVITYFORCE := 20
const MAXGRAVITY := 450
const JUMPFORCE := -600

var motion : Vector2

func _ready():
	camera.limit_left = cameraLimitsMin.x
	camera.limit_top = cameraLimitsMin.y
	camera.limit_right = cameraLimitsMax.x
	camera.limit_bottom = cameraLimitsMax.y

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
	
	motion = move_and_slide(motion, Vector2.UP)

func gravity():
	if not is_on_floor() and motion.y < MAXGRAVITY:
		motion.y += GRAVITYFORCE
		if motion.y > MAXGRAVITY:
			motion.y = MAXGRAVITY
