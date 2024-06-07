class_name StateMachine extends Node

export var initialState : NodePath

var states : Dictionary
var currentState : State
var parent

func _ready():
	parent = get_parent()
	
	for state in get_children():
		if not (state is State):
			push_warning("os filhos da state machine tem que serem do tipo 'State'!!!")
			continue
		
		states[state.name] = state
		state.parent = parent
	
	if initialState:
		var state := get_node(initialState)
		if not (state is State):
			push_warning("o State incial devem serem do tipo 'State'!!!")
		else:
			currentState = get_node(initialState)
			currentState.enter()

func processPhysics(delta):
	currentState.processPhysics(delta)

func processState():
	var newState = currentState.processState()
	if newState != null:
		changeState(newState)

func changeState(newState : String):
	if currentState:
		currentState.exit()
	
	if not states.has(newState):
		push_error("não existe state '{newState}' na stateMachine, chamado por '{lastState}'".format({
			"newState" : newState,
			"lastState" : currentState.name
		}))
	
	currentState = states[newState]
	currentState.enter()
