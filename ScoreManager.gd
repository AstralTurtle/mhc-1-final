extends Node2D
class_name scoreManager

var high: int = 0
var last: int = 0

func calculate(enemies, level):
	last = enemies + (level * 10)
	if last > high:
		high = last
