extends State


func enter():
	$"../../AnimationPlayer".play("OFF")
	parent.motion.x = 0

func processState():
	if parent.power != null:
		return "ON"
	
	return null
	



