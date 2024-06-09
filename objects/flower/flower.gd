class_name Flower extends Node2D

onready var flowerEffect := preload("res://audio/sfx/flower.wav")

signal captured

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		AudioManager.playEffect(flowerEffect, 1, 0.7)
		emit_signal("captured")
		queue_free()
