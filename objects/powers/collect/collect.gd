extends Node

export var powerType : Resource

func _ready():
	if powerType:
		$RedPower.texture = powerType.texture

func changeItem(item):
	powerType = item
	$RedPower.texture = powerType.texture

