class_name LevelClass extends Node2D

export(String, DIR) var currentWorld := "res://worlds/flowerCity"
export(int) var nextLevel := 1
export var playerPath : NodePath
var player

export(Array, NodePath) var flowers

var playerStart : Vector2

var selfPacked : PackedScene

var totalFlowers := 0
var flowerCaptured := -1

func _ready():
	player = get_node(playerPath)
	playerStart = player.position
	var _1 = player.connect("death", self, "death")
	
	for flower in flowers:
		var _2 = get_node(flower).connect("captured", self, "FlowerGet")
		totalFlowers += 1
	
	var background : PackedScene = load(currentWorld + "/background.tscn")
	var backgroundInstance = background.instance()
	add_child(backgroundInstance)
	
	
	
	flowerCaptured = 0

func FlowerGet():
	flowerCaptured += 1
	
	if flowerCaptured >= totalFlowers:
		if nextLevel == 0:
			LoadSystem.loadScene(self, "res://worlds/credits.tscn", true)
		var path := currentWorld + "/levels/level{id}.tscn".format({"id" : nextLevel})
		LoadSystem.loadScene(self, path, true)

func death():
	if flowerCaptured >= totalFlowers: return
	var _1 = get_tree().reload_current_scene()
