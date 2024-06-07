extends Control

export var Text : String
export var areaPath : NodePath
var area : Area2D

func _ready():
	$Label.text = Text
	visible = false
	
	if areaPath:
		area = get_node(areaPath)
		area.connect("area_entered", self, "entered")
		area.connect("area_exited", self, "exited")
	else:
		push_warning("no area informed to BallonText")
	
func entered(body):
	if body.is_in_group("player"):
		visible = true

func exited(body):
	if body.is_in_group("player"):
		visible = false
