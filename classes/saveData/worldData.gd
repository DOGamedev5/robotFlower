class_name WorldData extends Resource

var worldNecessary := 0
var currentLevel := 0
var maxLevels := 0

func _init(level, levelsMax, previusWorld):
	currentLevel = level
	maxLevels = levelsMax
	worldNecessary = previusWorld
