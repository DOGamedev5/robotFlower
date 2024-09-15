extends State


func enter():
	$"../../AnimationPlayer".play("ON")

func processState():
	if not parent.havePressed:
		return "OFF"
	
	return null
	
