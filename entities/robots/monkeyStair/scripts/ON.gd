extends State

onready var tween = $"../../Tween"

func enter():
	$"../../MonkeyStair".frame = 1
	tween.interpolate_property(
		$"../../Stairs", 
		"scale", 
		$"../../Stairs".scale,
		Vector2(2, 2),
		1.2,
		Tween.TRANS_EXPO, 
		Tween.EASE_OUT)
	
	tween.start()
	
	$"../../Area2D2/CollisionShape2D".disabled = false

func processState():
	if parent.power == null:
		return "OFF"
	
	return null
	
