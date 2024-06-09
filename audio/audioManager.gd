extends Node


func playSong(music):
	$music.stream = music
	$music.play()

func playEffect(sfx, pitch := 1.0, volume := 1.0):
	var newEffect = AudioStreamPlayer.new()
	newEffect.set_bus("sfx")
	newEffect.connect("finished", newEffect, "queue_free")
	newEffect.stream = sfx
	
	newEffect.pitch_scale = pitch
	newEffect.volume_db = linear2db(volume)
	
	add_child(newEffect)
	
	newEffect.play()
	
