extends State


func enter():
	$"../../AnimationPlayer".play("ON")

func processState():
	if parent.power == null:
		return "OFF"
	
	return null
	
