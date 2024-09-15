extends TextureButton

export(int) var index

var levelPath := ""

func _ready():
	$Label.text = String(index)
	levelPath = Global.currentWorld.getPath(index)

func _on_TextureButton_pressed():
		LoadSystem.loadScene(get_tree().current_scene, levelPath, true)
	


