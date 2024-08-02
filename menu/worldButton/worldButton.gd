extends Control

onready var textureRect := $button/NinePatchRect
onready var animation := $AnimationPlayer
onready var tween := $Tween

export(String, DIR) var world := "res://worlds/flowerCity"
export var worldName := "Robot City"

var worldInformation  : WorldData

signal selected(worldInfo)

var desactived := false

func _ready():
	worldInformation = Global.data.worlds[world]
	
	var unlockedWorlds := Global.data.worldsUnlocked
	if worldInformation.worldNecessary > unlockedWorlds:
		desactived = true
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
		var shake := 8
		var shakeTimes := 10
		var frequency := 0.05
		var lastPositionButton : Vector2 = $button.rect_position
		var lastPositionLabel : Vector2 = $Label.rect_position
		var finalPositionButton : Vector2 = $button.rect_position
		var finalPositionLabel : Vector2 = $Label.rect_position
		
		for i in shakeTimes:
			var position := Vector2(rand_range(-shake, shake), rand_range(-shake, shake))
#			tween.interpolate_property(self, "rect_pivot_offset", null, position, 0.5)

			tween.interpolate_property($button, "rect_position", lastPositionButton, position + Vector2(56, 0), 0, 0, 2, frequency*i)
			tween.interpolate_property($Label, "rect_position", lastPositionLabel, position + Vector2(0, 144), 0, 0, 2, frequency*i)
			lastPositionButton = position + Vector2(56, 0)
			lastPositionLabel = position + Vector2(0, 144)
		
		tween.interpolate_property($button, "rect_position", lastPositionButton, finalPositionButton, 0, 0, 2, frequency*(shakeTimes+1))
		tween.interpolate_property($Label, "rect_position", lastPositionLabel, finalPositionLabel, 0, 0, 2, frequency*(shakeTimes+1))
			
		tween.start()
#
	var worldInfo = Global.data.worlds[world]
	emit_signal("selected", worldInfo)
	

