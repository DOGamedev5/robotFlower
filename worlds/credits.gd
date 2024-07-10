extends Control

onready var menu := "res://menu/menu.tscn"
onready var tween := $Tween
onready var effect := preload("res://audio/sfx/fall.wav")

func _ready():
	tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
	tween.start()

func _on_Button_pressed():
	AudioManager.playEffect(effect, 1, 0.4)
	var _1 = get_tree().change_scene_to(load(menu))

func _on_Button_mouse_entered():
	AudioManager.playEffect(effect, 2, 0.3)


func _on_Tween_tween_all_completed():
	tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
	tween.start()
