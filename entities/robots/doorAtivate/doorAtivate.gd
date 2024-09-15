extends RobotClass

onready var stateMachine = $StateMachine
var havePressed := false

var objectsPress := []

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()

func _on_Area2D_body_entered(body):
	power = Power.new()
	havePressed = true
	objectsPress.append(body)

func _on_Area2D_body_exited(body):
	objectsPress.erase(body)
	if not objectsPress:
		power = null
		havePressed = false
