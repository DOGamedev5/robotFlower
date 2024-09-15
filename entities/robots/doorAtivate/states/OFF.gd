extends State

func enter():
	$"../../AnimationPlayer".play("OFF")

func processState():
	if parent.havePressed:
		return "ON"
	
	return null
	
