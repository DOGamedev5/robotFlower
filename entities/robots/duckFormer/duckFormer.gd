extends RobotClass

onready var stateMachine = $StateMachine

var motion : Vector2

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
	
	motion = move_and_slide(motion)
