class_name Flower extends Node2D

signal captured

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		emit_signal("captured")
		queue_free()
