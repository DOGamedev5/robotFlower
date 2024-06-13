extends Control

onready var level1 := preload("res://world/levels/level1.tscn")
onready var credits := preload("res://world/credits.tscn")

onready var effect := preload("res://audio/sfx/fall.wav")

onready var menuMusic := preload("res://audio/musics/menu-robots-and-flowers.ogg")
onready var levelMusic := preload("res://audio/musics/time-to-get-some-flowers.ogg")

func _ready():
	AudioManager.playSong(menuMusic)

func _on_play_pressed():
	AudioManager.playSong(levelMusic)
	AudioManager.playEffect(effect, 1, 0.4)
	var _1 = get_tree().change_scene_to(level1)

func _on_credits_pressed():
	AudioManager.playSong(levelMusic)	
	AudioManager.playEffect(effect, 1, 0.4)
	var _1 = get_tree().change_scene_to(credits)

func _hover():
	AudioManager.playEffect(effect, 2, 0.3)
