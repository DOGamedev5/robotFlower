class_name WorldData extends Resource

export var worldNecessary := 0
export var currentLevel := 0
export var maxLevels := 0
export var name := ""

func _init(level : int = 0, levelsMax : int = 10, previusWorld : int = 0, Name := ""):
	name = Name
	currentLevel = level
	maxLevels = levelsMax
	worldNecessary = previusWorld

func getPath(index):
	var world = name.replace(" ", "")
	
	return "res://worlds/{world}/levels/level{index}.tscn".format({"world" : world, "index" : index})

func getBackground():
	var world = name.replace(" ", "")
	
	return "res://worlds/{world}/background.tscn".format({"world" : world})
