extends RobotClass

onready var stateMachine = $StateMachine

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
