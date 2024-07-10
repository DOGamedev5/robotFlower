extends CanvasLayer

onready var tween = $Tween
onready var colorRect = $ColorRect
onready var percent = $Label

signal entered
signal exited

const timer = 0.5

func enter():
	$Label.visible = false
	colorRect.material["shader_param/time"] = 0
	tween.interpolate_property(colorRect.material, "shader_param/time", 0, 1.57, timer)
	tween.start()
	yield(tween, "tween_all_completed")

	emit_signal("entered")

func exit():
	colorRect.material["shader_param/time"] = 1.57
	$Label.visible = false
	tween.interpolate_property(colorRect.material, "shader_param/time", 1.57, 0, timer)
	tween.start()
	yield(tween, "tween_all_completed")
	queue_free()
	emit_signal("exited")
	get_tree().paused = false
