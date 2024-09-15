extends Control

onready var textureRect := $button/NinePatchRect
onready var animation := $AnimationPlayer
onready var tween := $Tween

export(String, DIR) var world := "res://worlds/FlowerCity"
export var worldName := "Flower City"

var worldInformation  : WorldData

var desactived := false

func _ready():
	worldInformation = Global.data.worlds[worldName]
	
	var unlockedWorlds := Global.data.worldsUnlocked
	if worldInformation.worldNecessary > unlockedWorlds:
		desactived = true
	
	setupApperence()
	
	$Label.text = worldName
	textureRect.texture["atlas"] = load(world + "/icon.png")
	textureRect.region_rect.position = Vector2.ZERO

func setupApperence():
	$button/lock.visible = desactived
	
	if desactived:
		$button/NinePatchRect.modulate = Color8(115, 105, 145)
	else:
		$button/NinePatchRect.modulate = Color.white
		

func _on_button_mouse_entered():
	textureRect.texture.region.position.y = 70
	var currentPosition : float = 0.0
	if animation.is_playing(): currentPosition = animation.current_animation_position
	animation.play("hovered")
	animation.seek(currentPosition, true)

func _on_button_mouse_exited():
	textureRect.texture.region.position.y = 0	
	var currentPosition : float = 3.0
	if animation.is_playing(): currentPosition = animation.current_animation_position
	animation.play_backwards("hovered")
	animation.seek(currentPosition, true)

func _on_button_pressed():
	if desactived:
		AudioManager.playEffect(Global.fallSound, 0.55, 0.75)
		var shake := 4.5
		var shakeTimes := 10
		var frequency := 0.02
		var lastPositionButton : Vector2 = $button.rect_position
		var finalPositionButton : Vector2 = $button.rect_position
		
		for i in shakeTimes:

			var position := Vector2(shake* rand_range(-1, 1), shake* rand_range(-1.0, 1))

			tween.interpolate_property($button, "rect_position", lastPositionButton, position + Vector2(56, 0), 0, 0, 2, frequency*i)

			lastPositionButton = position + Vector2(56, 0)
		
		tween.interpolate_property($button, "rect_position", lastPositionButton, finalPositionButton, 0, 0, 2, frequency*(shakeTimes+1))
			
		tween.start()
		return

	Global.currentWorld = worldInformation
	LoadSystem.loadScene(get_tree().current_scene, "res://menu/levelSelect/levelSelect.tscn", true)
	

