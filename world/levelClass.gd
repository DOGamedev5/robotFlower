class_name LevelClass extends Node2D


export(String, FILE, "*.tscn") var nextLevel
export var playerPath : NodePath
var player

export(Array, NodePath) var flowers

var playerStart : Vector2

var selfPacked : PackedScene
var nextPacked : PackedScene

var totalFlowers := 0
var flowerCaptured := -1

func _ready():
	player = get_node(playerPath)
	playerStart = player.position
	var _1 = player.connect("death", self, "death")
	
	nextPacked = load(nextLevel)
	
	for flower in flowers:
		var _2 = get_node(flower).connect("captured", self, "FlowerGet")
		totalFlowers += 1
	
	flowerCaptured = 0

func FlowerGet():
	flowerCaptured += 1
	
	if flowerCaptured >= totalFlowers:
		var _1 = get_tree().change_scene(nextLevel)

func death():
	if flowerCaptured >= totalFlowers: return
	var _1 = get_tree().reload_current_scene()
