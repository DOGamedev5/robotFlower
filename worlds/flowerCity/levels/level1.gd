extends LevelClass

onready var label = $CanvasLayer/VBoxContainer/Label
onready var duck = $RigidBody2D

var tutorialParts := 0

func _ready():
	label.text = "move using A and D"

func _process(_delta):
	match tutorialParts:
		0:
			if Input.get_axis("ui_left", "ui_right"):
				tutorialParts += 1
				label.text = "go to the gear and press K to grab the gear"
		1:
			if player.grabbedItem:
				tutorialParts += 1
				label.text = "press L to drop the gear"
		2:
			if not player.grabbedItem:
				tutorialParts += 1
				label.text = "grap the gear and go to the duck and press K"
		3:
			if duck.power:
				label.text = "good job boy"
