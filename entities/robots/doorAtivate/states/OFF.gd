extends State

func enter():
	$"../../AnimationPlayer".play("OFF")

func processState():
	if parent.power != null:
		return "ON"
	
	return null
	
