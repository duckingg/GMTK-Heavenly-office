extends Node2D

@export var max_speed = 2.0
@export var min_speed = 0.5

var person_codes = []

var ID = 1
var spawn_dealy : float
var person_speed : float

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Viewport received click")

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept"):
		randomize()
		
		spawn_dealy = randf_range(0.0, 0.5)
		await get_tree().create_timer(spawn_dealy).timeout
		person_speed = randf_range( min_speed , max_speed)
		$spawners/Spawner.spawn_person("L-R", person_speed, ID, 25)
		ID += 1
		
		spawn_dealy = randf_range(0.0, 0.5)
		await get_tree().create_timer(spawn_dealy).timeout
		person_speed = randf_range( min_speed , max_speed)
		$spawners/Spawner2.spawn_person("L-R", person_speed, ID, 25)
		ID += 1
		
		spawn_dealy = randf_range(0.0, 0.5)
		await get_tree().create_timer(spawn_dealy).timeout
		person_speed = randf_range( min_speed , max_speed)
		$spawners/Spawner3.spawn_person("L-R", person_speed, ID, 25)
		ID += 1
		
		spawn_dealy = randf_range(0.0, 0.5)
		await get_tree().create_timer(spawn_dealy).timeout
		person_speed = randf_range( min_speed , max_speed)
		$spawners/Spawner4.spawn_person("R-L", person_speed, ID, 25)
		ID += 1
		
		spawn_dealy = randf_range(0.0, 0.5)
		await get_tree().create_timer(spawn_dealy).timeout
		person_speed = randf_range( min_speed , max_speed)
		$spawners/Spawner5.spawn_person("R-L", person_speed, ID, 25)
		ID += 1


func update_person_codes(code):
	if code not in person_codes:
		person_codes.append(code)
		return true
	elif code in person_codes:
		return false
