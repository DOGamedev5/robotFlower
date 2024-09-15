class_name LevelClass extends Node2D

export(String, DIR) var currentWorld := "res://worlds/FlowerCity"
export(String, FILE, "*.tscn") var nextLevel
export var currentLevel := -1
export var playerPath : NodePath
var player

export(Array, NodePath) var flowers

var playerStart : Vector2

var selfPacked : PackedScene

var totalFlowers := 0
var flowerCaptured := -1
var gameStoped := false

func _ready():
	player = get_node(playerPath)
	playerStart = player.position
	var _1 = player.connect("death", self, "death")
	
	for flower in flowers:
		var _2 = get_node(flower).connect("captured", self, "FlowerGet")
		totalFlowers += 1
	
	var background : PackedScene = load(Global.currentWorld.getBackground())
	var backgroundInstance = background.instance()
	add_child(backgroundInstance)
	
	flowerCaptured = 0

func _input(_event):
	if Input.is_action_just_pressed("ui_home"):
		gameStoped = true
		LoadSystem.loadScene(get_tree().current_scene, "res://menu/menu.tscn", true)

func FlowerGet():
	flowerCaptured += 1
	
	if flowerCaptured >= totalFlowers:
		gameStoped = true
		var path = nextLevel
		if not path:
			path = Global.currentWorld.getPath(currentLevel+1)
		
		if Global.currentWorld.currentLevel < currentLevel:
			Global.currentWorld.currentLevel = currentLevel
			
			
		LoadSystem.loadScene(self, path, true)

func death():
	if gameStoped: return
	var _1 = get_tree().reload_current_scene()
