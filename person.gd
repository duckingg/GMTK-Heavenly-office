extends Node2D

@export var direction:  String
@export var speed: int

func _process(delta: float) -> void:
	if direction == "L-R":
		$".".position.x += delta * speed * 100
	elif direction == "R-L":
		$".".position.x -= delta * speed * 100
