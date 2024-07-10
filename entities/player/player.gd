extends KinematicBody2D

export var cameraLimitsMin := Vector2(-10000000, -10000000)
export var cameraLimitsMax := Vector2(10000000, 10000000)

onready var camera := $Camera2D
onready var stateMachine := $StateMachine
onready var animationTree := $AnimationTree
onready var icon := $HUD/Control/Control/VBoxContainer/HBoxContainer/icon/item
onready var countFlowers := $HUD/Control/Control2/NinePatchRect/HBoxContainer/Label2
onready var playback = animationTree["parameters/playback"]

onready var collect := preload("res://objects/powers/collect/collect.tscn")
onready var stepSfx := preload("res://audio/sfx/step.wav")

const VELOCITY := 300
const GRAVITYFORCE := 20
const MAXGRAVITY := 450
const JUMPFORCE := -630

var motion : Vector2
var itemToGrab : Array
var robotToInteract
var grabbedItem : Power
var onStair := false

var canJump := true
var coyotTimer := true

signal death

func _ready():
	camera.limit_left = cameraLimitsMin.x
	camera.limit_top = cameraLimitsMin.y
	camera.limit_right = cameraLimitsMax.x
	camera.limit_bottom = cameraLimitsMax.y
	

func _physics_process(delta):
	stateMachine.processState()
	stateMachine.processPhysics(delta)
	
	if Input.is_action_just_pressed("grab"):
		if itemToGrab:
			if grabbedItem and robotToInteract:
				grabbedItem = robotToInteract.swapPower(grabbedItem)
			else:
				grabItem()
		elif robotToInteract:
			grabbedItem = robotToInteract.swapPower(grabbedItem)
			
		

	
	if Input.is_action_just_pressed("drop") and grabbedItem:
		dropItem()
	
	if motion.x:
		$sprite.flip_h = motion.x < 0 
	
	countFlowers.text = "{0}/{1}".format([get_parent().flowerCaptured, get_parent().totalFlowers])
	
	if grabbedItem != null:
		icon.texture = grabbedItem.texture
	else:
		icon.texture = null
	
	jumpDetect()
	motion = move_and_slide(motion, Vector2.UP)

func grabItem():
	var lastItem = grabbedItem
	grabbedItem = itemToGrab[0].get_parent().powerType
	itemToGrab[0].get_parent().powerType = lastItem
	
	if not lastItem:
		itemToGrab[0].get_parent().queue_free()
	else:
		itemToGrab[0].get_parent().updateTexture()

func dropItem():
	var newCollect = collect.instance()
	
	newCollect.position = position
	newCollect.powerType = grabbedItem
	
	get_parent().add_child(newCollect)
	grabbedItem = null

func gravity():
	if motion.y < MAXGRAVITY:
		motion.y += GRAVITYFORCE
		if motion.y > MAXGRAVITY:
			motion.y = MAXGRAVITY

func jumpDetect():
	if is_on_floor():
		canJump = true
		coyotTimer = true
		
	elif coyotTimer:
		canJump = true
		coyotTimer = false
		$Timer.start()
	
	elif $Timer.is_stopped():
		canJump = false
		coyotTimer = false

func step():
	AudioManager.playEffect(stepSfx)

func _on_grabber_area_entered(area):
	if area.is_in_group("power"):
		itemToGrab.append(area)
	
	elif area.is_in_group("robot"):
		robotToInteract = area.get_parent()
	
	if area.is_in_group("stair"):
		onStair = true

func _on_grabber_area_exited(area):
	if area.is_in_group("power"):
		itemToGrab.remove(itemToGrab.find(area))
	
	elif area.is_in_group("robot"):
		robotToInteract = null
	
	if area.is_in_group("stair"):
		onStair = false

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("death")
