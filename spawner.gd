extends Node2D

@export var person_scean: PackedScene

func spawn_person( direction, speed, Person_ID):
	var person = person_scean.instantiate()
	person.direction = direction
	person.speed = speed
	person.person_ID = Person_ID
	add_child(person)
	person.position = Vector2(0,0)
