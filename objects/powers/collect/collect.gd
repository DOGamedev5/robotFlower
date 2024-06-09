extends Node

export var powerType : Resource

func _ready():
	if powerType:
		$RedPower.texture = powerType.texture

func updateTexture():
	$RedPower.texture = powerType.texture

