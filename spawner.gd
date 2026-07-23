extends Node2D

@export var person_scean: PackedScene

func spawn_person( direction, speed ):
	var person = person_scean.instantiate()
	person.direction = direction
	person.speed = speed
	add_child(person)
	person.position = Vector2(0,0)
