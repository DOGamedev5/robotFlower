extends State

onready var tween = $"../../Tween"

func enter():
	$"../../MonkeyStair".frame = 0
	tween.interpolate_property(
		$"../../Stairs", 
		"scale", 
		$"../../Stairs".scale,
		Vector2(2, 0),
		0.5,
		Tween.TRANS_QUAD, 
		Tween.EASE_OUT)
	tween.start()
	
	$"../../Area2D2/CollisionShape2D".disabled = true

func processState():
	if parent.power != null:
		return "ON"
	
	return null
	
