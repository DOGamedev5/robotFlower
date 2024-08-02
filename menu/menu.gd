extends Control

onready var credits := preload("res://worlds/credits.tscn")

onready var menuMusic := preload("res://audio/musics/menu-robots-and-flowers.ogg")
onready var levelMusic := preload("res://audio/musics/time-to-get-some-flowers.ogg")

onready var tween := $Tween

func _ready():
	if Global.enteredGame == false:
		$AnimationPlayer.play("intro")
	
	Global.enteredGame = true
	
	AudioManager.playSong(menuMusic)
	tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
	tween.start()

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and $AnimationPlayer.is_playing():
		$AnimationPlayer.stop()
		$TextureRect.visible = false

func _on_play_pressed():
	AudioManager.playEffect(Global.fallSound, 1, 0.4)
	$innitial.visible = false
	$worlds.visible = true

func _on_credits_pressed():
	AudioManager.playSong(levelMusic)	
	AudioManager.playEffect(Global.fallSound, 1, 0.4)
	var _1 = get_tree().change_scene_to(credits)

func _hover():
	AudioManager.playEffect(Global.fallSound, 2, 0.3)

func _on_Tween_tween_all_completed():
	tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
	tween.start()

func _on_exit_pressed():
	get_tree().quit()
