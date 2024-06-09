extends Control

onready var menu := "res://menu/menu.tscn"

onready var effect := preload("res://audio/sfx/fall.wav")

func _on_Button_pressed():
	AudioManager.playEffect(effect, 1, 0.4)
	var _1 = get_tree().change_scene_to(load(menu))

func _on_Button_mouse_entered():
	AudioManager.playEffect(effect, 2, 0.3)
