class_name State extends Node

var parent

## chamado quando state inicia
func enter():
	pass

## process do state
func processPhysics(_delta):
	pass

## processa mudança de states
func processState():
	pass

## chamado quando muda o state
func exit():
	pass
