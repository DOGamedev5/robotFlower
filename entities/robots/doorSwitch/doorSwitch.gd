extends RobotClass

onready var stateMachine = $StateMachine

export var ativatePath : NodePath

var ativation

func _ready():
	if ativatePath:
		ativation = get_node(ativatePath)

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
