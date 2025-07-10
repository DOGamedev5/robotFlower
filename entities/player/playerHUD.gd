extends CanvasLayer

onready var flowerCount := $MarginContainer/VBoxContainer/HBoxContainer/Control/VBoxContainer/HBoxContainer/Label
onready var icon := $MarginContainer/VBoxContainer/HBoxContainer/Control/VBoxContainer/HBoxContainer/icon/item

func iconChanged(newIcon):
	icon.texture = newIcon

func updateCount(getted, total):
	flowerCount.text = "{cunt}/{total}".format(
		{
			"count" : getted,
			"total" : total
		}
	)

func _on_player_changedState(newState):
	$MarginContainer/VBoxContainer/mobileInput.changedState(newState)
