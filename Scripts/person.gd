extends Node2D

var body_parts = {
	"body" : preload("res://Sprites/Mini player sprite/Body.png"),
	"hair_1" : preload("res://Sprites/Mini player sprite/Hair1.png"),
	"hair_2" : preload("res://Sprites/Mini player sprite/Hair2.png"),
	"hands" : preload("res://Sprites/Mini player sprite/Hands.png"),
	"head" : preload("res://Sprites/Mini player sprite/Head.png"),
	"legs" : preload("res://Sprites/Mini player sprite/Legs.png")
}

var person_code : int


func _ready() -> void:
	randomize()
	var a : int = randi_range(1, 3) # Hair type
	var b : int = randi_range(1, 4) # Hair color
	var c : int = randi_range(1, 3) # Skin tone
	var d : int = randi_range(1, 5) # Shirt color
	var e : int = randi_range(1, 2) # Arm type
	var f : int = randi_range(1, 5) # Leg color
	
	var shirt_color
	var head_color
	
	if a == 2:
		$Node/hair.texture = body_parts["hair_1"]
	elif a == 3:
		$Node/hair.texture = body_parts["hair_2"]
	
	if b == 1:
		$Node/hair.modulate = Color.WEB_GRAY
	elif b == 2:
		$Node/hair.modulate = Color.BLACK
	elif b == 3:
		$Node/hair.modulate = Color.DARK_ORANGE
	elif b == 4:
		$Node/hair.modulate = Color.RED
	
	if c == 1:
		$Node/head.modulate = Color.BURLYWOOD
		head_color = "BURLYWOOD"
	elif c == 2:
		$Node/head.modulate = Color.SANDY_BROWN
		head_color = "SANDY_BROWN"
	elif c == 3:
		$Node/head.modulate = Color.SADDLE_BROWN
		head_color = "SADDLE_BROWN"
	
	if d == 1:
		$Node/body.modulate = Color.GRAY
		shirt_color = "GRAY"
	elif d == 2:
		$Node/body.modulate = Color.DARK_RED
		shirt_color = "DARK_RED"
	elif d == 3:
		$Node/body.modulate = Color.DARK_GREEN
		shirt_color = "DARK_GREEN"
	elif d == 4:
		$Node/body.modulate = Color.DARK_BLUE
		shirt_color = "DARK_BLUE"
	elif d == 5:
		$Node/body.modulate = Color.BLACK
		shirt_color = "BLACK"
	
	if e == 1:
		$Node/hands.modulate = Color.from_string(shirt_color, Color.WHITE)
	if e == 2:
		$Node/hands.modulate = Color.from_string(head_color, Color.WHITE)
	
	if f == 1:
		$Node/legs.modulate = Color.GRAY
	if f == 2:
		$Node/legs.modulate = Color.DARK_RED
	if f == 3:
		$Node/legs.modulate = Color.DARK_GREEN
	if f == 4:
		$Node/legs.modulate = Color.DARK_BLUE
	if f == 5:
		$Node/legs.modulate = Color.BLACK
	
	z_index = $".".global_position.y
	await get_tree().create_timer(lifetime).timeout
	queue_free()

@export var lifetime: int
@export var direction:  String
@export var speed: float
@export var person_ID: int

func _process(delta: float) -> void:
	$Node/hands.speed_scale = speed
	$Node/legs.speed_scale = speed
	if direction == "L-R":
		$".".position.x += delta * speed * 100
	elif direction == "R-L":
		$".".position.x -= delta * speed * 100
		$Node/hands.flip_h = true
		$Node/legs.flip_h = true
		$Node/hair.flip_h = true
		$Node/head.flip_h = true
		$Node/body.flip_h = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print(person_ID)
