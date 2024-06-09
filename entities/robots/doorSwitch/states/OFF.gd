extends State

onready var tween = $"../../Tween"

func enter():
	$"../../DoorSwitch".frame = 1
	tween.interpolate_property(
		$"../../Door", 
		"scale", 
		$"../../Door".scale,
		Vector2(2, 2),
		0.5,
		Tween.TRANS_QUAD, 
		Tween.EASE_OUT)
	tween.start()
	
	$"../../shape2".disabled = false

func processState():
	if parent.ativation.power != null:
		return "ON"
	
	return null
	
