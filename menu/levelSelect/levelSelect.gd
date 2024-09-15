extends Control

onready var tween := $Tween
onready var buttons := $MarginContainer/VBoxContainer/VBoxContainer
onready var worldData : WorldData
onready var buttonScene := preload("res://menu/levelSelect/buttonLevel/buttonLevel.tscn")

func _ready():
	tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
	tween.start()
	
	worldData = Global.currentWorld
	buttons.get_node("line2").visible = false
	
	var maxLine1 := 7

	if Global.currentWorld.maxLevels > 7 and Global.currentWorld.maxLevels < 14:
		var division : float = float(Global.currentWorld.maxLevels) / 2.0
		maxLine1 = int(ceil(division))

	for i in range(Global.currentWorld.maxLevels):
		var buttonObj = buttonScene.instance()
		buttonObj.index = i + 1
		
		if i > Global.currentWorld.currentLevel:
			buttonObj.disabled = true
		
		if i < maxLine1:
			buttons.get_node("line1").visible = true
			buttons.get_node("line1").add_child(buttonObj)
		else:
			buttons.get_node("line2").visible = true
			buttons.get_node("line2").add_child(buttonObj)


func _on_Tween_tween_completed(object, _key):
	if object == $background:
		tween.interpolate_property($background, "rect_position", Vector2(0, 0), Vector2(-1040, -1040), 14)
		tween.start()
