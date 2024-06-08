extends Node


func playSong(music):
	$music.stream = music
	$music.play()

func playEffect(sfx):
	var newEffect = AudioStreamPlayer.new()
	newEffect.set_bus("sfx")
	newEffect.connect("finished", newEffect, "queue_free")
	newEffect.stream = sfx
	get_tree().current_scene.add_child(newEffect)
	
	newEffect.play()
	
