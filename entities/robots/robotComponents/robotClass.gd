class_name RobotClass extends KinematicBody2D

export var power : Resource
export var iconPath : NodePath
var icon

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
	else:
		icon.setTexture(null)
		
	return powerReturn
