class_name WorldData extends Resource

var worldPath := ""
var worldNecessary := 0
var currentLevel := 0
var maxLevels := 0

func _init(level, levelsMax, previusWorld, path):
	currentLevel = level
	maxLevels = levelsMax
	worldNecessary = previusWorld
	worldPath = path
