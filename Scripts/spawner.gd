extends Node2D

@export var person_scean: PackedScene

var person_code

func spawn_person( direction, speed, Person_ID, lifetime):
	randomize()
	var rand = randi_range(-5,5)
	var person = person_scean.instantiate()
	person.lifetime = lifetime
	person.direction = direction
	person.speed = speed
	person.person_ID = Person_ID
	add_child(person)
	person.position = Vector2(0,rand)
	person_code = person.person_code
	var verification = await $".".get_parent().get_parent().update_person_codes(person_code)
	
	if verification == true:
		pass
	elif verification == false:
		person.queue_free()
		print("Copy detected and destroyed")
