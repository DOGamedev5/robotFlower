extends KinematicBody2D

export var cameraLimitsMin := Vector2(-10000000, -10000000)
export var cameraLimitsMax := Vector2(10000000, 10000000)

onready var camera := $Camera2D
onready var stateMachine := $StateMachine
onready var animationTree := $AnimationTree
onready var playback = animationTree["parameters/playback"]

onready var collect := preload("res://objects/powers/collect/collect.tscn")

const VELOCITY := 300
const GRAVITYFORCE := 20
const MAXGRAVITY := 450
const JUMPFORCE := -600

var motion : Vector2
var itemToGrab : Array
var robotToInteract
var grabbedItem : Power

signal death

func _ready():
	camera.limit_left = cameraLimitsMin.x
	camera.limit_top = cameraLimitsMin.y
	camera.limit_right = cameraLimitsMax.x
	camera.limit_bottom = cameraLimitsMax.y

func _physics_process(delta):
	stateMachine.processPhysics(delta)
	stateMachine.processState()
	
	if Input.is_action_just_pressed("grab"):
		if robotToInteract:
			grabbedItem = robotToInteract.swapPower(grabbedItem)
			
		elif itemToGrab:
			grabItem()
	
	if Input.is_action_just_pressed("drop") and grabbedItem:
		dropItem()
	
	if motion.x:
		$sprite.flip_h = motion.x < 0 
	
	motion = move_and_slide(motion, Vector2.UP)

func grabItem():
	var lastItem = grabbedItem
	grabbedItem = itemToGrab[0].get_parent().powerType
	
	if not lastItem:
		itemToGrab[0].get_parent().queue_free()
	else:
		itemToGrab[0].changeItem(lastItem)

func dropItem():
	var newCollect = collect.instance()
	
	newCollect.position = position
	newCollect.powerType = grabbedItem
	
	get_parent().add_child(newCollect)
	grabbedItem = null

func gravity():
	if not is_on_floor() and motion.y < MAXGRAVITY:
		motion.y += GRAVITYFORCE
		if motion.y > MAXGRAVITY:
			motion.y = MAXGRAVITY

func _on_grabber_area_entered(area):
	if area.is_in_group("power"):
		itemToGrab.append(area)
	
	elif area.get_parent() is RobotClass:
		robotToInteract = area.get_parent()

func _on_grabber_area_exited(area):
	if area.is_in_group("power"):
		itemToGrab.remove(itemToGrab.find(area))
	
	elif area.get_parent() is RobotClass:
		robotToInteract = null

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("death")
