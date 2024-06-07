extends Control

export var areaPath : NodePath

onready var icon = $NinePatchRect/icon

var area
var canInteract := false

func _ready():
	visible = false
	if areaPath:
		area = get_node(areaPath)
		var _1 = area.connect("area_entered", self, "entered")
		var _2 = area.connect("area_exited", self, "exited")

func setTexture(texture):
	icon.texture = texture

func entered(body):
	if body.is_in_group("player"):
		visible = true
		canInteract = true

func exited(body):
	if body.is_in_group("player"):
		visible = false
		canInteract = false
