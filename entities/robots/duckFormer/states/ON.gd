extends State


func enter():
	$"../../AnimationPlayer".play("ON")
	
func processPhysics(_delta):
	parent.motion.x = 120 * parent.direction

func processState():
	if parent.power == null:
		return "OFF"
	
	return null
