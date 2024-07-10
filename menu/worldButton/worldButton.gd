extends Control

onready var textureRect := $button/NinePatchRect
onready var animation := $AnimationPlayer

export(String, DIR) var world := "res://worlds/flowerCity"
export var worldName := "Robot City"



func _ready():
	$Label.text = worldName
	textureRect.texture = load(world + "/icon.png")
	textureRect.region_rect.position = Vector2.ZERO
	textureRect.region_rect.size = Vector2(18, 34)

func _on_button_mouse_entered():
	var currentPosition : float = 0.0
	if animation.is_playing(): currentPosition = animation.current_animation_position
	animation.play("hovered")
	animation.seek(currentPosition, true)

func _on_button_mouse_exited():
	var currentPosition : float = 3.0
	if animation.is_playing(): currentPosition = animation.current_animation_position
	animation.play_backwards("hovered")
	animation.seek(currentPosition, true)


func _on_button_pressed():
	pass # Replace with function body.
