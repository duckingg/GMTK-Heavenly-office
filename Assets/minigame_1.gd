extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$spawners/Spawner.spawn_person("L-R", 10)
