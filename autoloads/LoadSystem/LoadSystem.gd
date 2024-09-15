extends CanvasLayer

const loadScreen := preload("res://autoloads/LoadSystem/LoadScreen.tscn")
const MAIN_SCENE := "res://menu/menu.tscn"

var loadSceneInstance

signal finishedLoad()

func loadScene(current, next : String, closeAfterLoad := false,currentPath := MAIN_SCENE):
	loadSceneInstance = loadScreen.instance()
	get_tree().paused = true
	get_tree().get_root().call_deferred("add_child", loadSceneInstance)
	loadSceneInstance.call_deferred("enter")
	
	var loader := ResourceLoader.load_interactive(next)
	
	if loader == null:
		emit_signal("finishedLoad")
		printerr("failed to load")
		return
	
	yield(loadSceneInstance, "entered")
	
	var label = loadSceneInstance.get_node("Label")
	current.queue_free()
	
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	
	while true:
		var error = loader.poll()
		
		if error == OK:
			label.text = str(float(loader.get_stage()) / loader.get_stage_count() * 100) + "%"

		
		elif error == ERR_FILE_EOF:
			label.text = "100%"
			
			var scene = loader.get_resource().instance()
			emit_signal("finishedLoad")
			get_tree().get_root().call_deferred("add_child", scene)
			get_tree().set_deferred("current_scene", scene)
			
			if closeAfterLoad:
				closeLoad()
			
			return
		
		else:
			var currentScene = load(currentPath)
#			get_tree().get_root().call_deferred("add_child", currentScene)
			get_tree().get_root().add_child(currentScene)
			get_tree().current_scene = currentScene
			emit_signal("finishedLoad")
			closeLoad()
			
			return

func loadObject(object, screen := true):
	var label
	var loader := ResourceLoader.load_interactive(object)
	
	if loader == null:
		emit_signal("finishedLoad")
		printerr("failed to load")
		return
	
	if screen:
		label = loadSceneInstance.get_node("Label")
	
	while true:
		
		var error = loader.poll()
		
		if error == OK:
			if screen: label.text = str(float(loader.get_stage()) / loader.get_stage_count() * 100) + "%"
	
		elif error == ERR_FILE_EOF:
			if screen: label.text = "100%"
			var scene = loader.get_resource()
			emit_signal("finishedLoad")
			return scene
		
		else:
			emit_signal("finishedLoad")
			return

func closeLoad():
	loadSceneInstance.exit()
