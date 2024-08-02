extends MarginContainer

func _on_exit_pressed():
	AudioManager.playEffect(Global.fallSound, 1, 0.4)
	visible = false
	$"../innitial".visible = true
