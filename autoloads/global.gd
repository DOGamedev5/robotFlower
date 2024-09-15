extends Node

const savePath := "save.tres"

var currentWorld : WorldData
var enteredGame := false

var data : SaveData
var _file := File.new()

onready var fallSound := preload("res://audio/sfx/fall.wav")
onready var flowerSound := preload("res://audio/sfx/flower.wav")
onready var jumpSound := preload("res://audio/sfx/jump.wav")
onready var robotoffSound := preload("res://audio/sfx/robotoff.wav")
onready var robotonSound := preload("res://audio/sfx/roboton.wav")
onready var stepSound := preload("res://audio/sfx/step.wav")

func _ready():
	if _file.file_exists(savePath):
		data = ResourceLoader.load(savePath)
		
	else:
		data = SaveData.new()
		saveGame()

func saveGame():
	var _1 := ResourceSaver.save(savePath, data)
	
