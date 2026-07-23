extends Node2D

func _ready() -> void:
	z_index = $".".global_position.y
	await get_tree().create_timer(25).timeout
	queue_free()

@export var direction:  String
@export var speed: float
@export var person_ID: int

func _process(delta: float) -> void:
	if direction == "L-R":
		$".".position.x += delta * speed * 100
	elif direction == "R-L":
		$".".position.x -= delta * speed * 100


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print(person_ID)
