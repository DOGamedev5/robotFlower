extends RobotClass

export var flipped := false

onready var stateMachine = $StateMachine

var motion : Vector2
var direction := 1

func _ready():
	$DuckFormer.flip_h = flipped
	direction = 1 - (2 * int(flipped))
	
	$shape2.position.x = $shape2.position.x * direction
	
	$Control.rect_position.x = $Control.rect_position.x * 1
	$KinematicBody2D/shape1.position.x = $KinematicBody2D/shape1.position.x * direction	
	$KinematicBody2D/shape2.position.x = $KinematicBody2D/shape2.position.x * direction

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
	
	motion.x = move_and_slide(motion).x
	
