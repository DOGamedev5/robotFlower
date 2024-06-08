class_name RobotClass extends KinematicBody2D

export var power : Resource
export var iconPath : NodePath
var icon

onready var off := preload("res://audio/sfx/robotoff.wav")
onready var on := preload("res://audio/sfx/roboton.wav")

func _ready():
	if iconPath:
		icon = get_node(iconPath)
		if power:
			icon.setTexture(power.texture)
		else:
			icon.setTexture(null)
		
func swapPower(newPower):
	var powerReturn = power
	power = newPower
	
	if power:
		icon.setTexture(power.texture)
		if not powerReturn:
			AudioManager.playEffect(on)
	else:
		icon.setTexture(null)
		if powerReturn:
			AudioManager.playEffect(off)
		
	return powerReturn
