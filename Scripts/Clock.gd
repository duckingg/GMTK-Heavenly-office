extends Sprite2D

@export var Tick_start_time = 30
@export var scale_start_time = 15

@onready var second_hand = $Second_hand

var second = 0
var time = 60.0

var current_tween : Tween
var editing = false

func _process(delta):
	if editing == true:
		second = 0.9
		
	if editing == false:
		second += delta
		
		if second >= 1:
			second = 0
			time -= 1
			time_update("normal")
	
	if Input.is_action_just_pressed("ui_up"):
		time += 10
		time_update("edit")
	if Input.is_action_just_pressed("ui_down"):
		time -= 10
		time_update("edit")

func edit_time(amount):
	time += amount
	time_update("edit")

func time_update(type):
	if current_tween:
		#print("Killing tween:", current_tween.get_instance_id())
		current_tween.kill()

	current_tween = create_tween()
	#print("Created tween:", current_tween.get_instance_id(), " type:", type)

	if type == "normal":
		if time <= Tick_start_time:
			current_tween.set_trans(Tween.TRANS_ELASTIC)
		else:
			current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			second_hand,
			"rotation",
			deg_to_rad(time * 6),
			0.9
		)
		
		if time <= scale_start_time and time > scale_start_time / 5.0:
			current_tween.parallel()
			current_tween.tween_property(
				self,
				"scale",
				Vector2( scale_start_time/time , scale_start_time/time ),
				0.9
			)
		elif time > scale_start_time:
			current_tween.parallel()
			current_tween.tween_property(
				self,
				"scale",
				Vector2( 1, 1 ),
				0.9
			)
		
		print(time)
		
	elif type == "edit":
		editing = true
		current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			second_hand,
			"rotation",
			deg_to_rad(time * 6),
			0.5
		)
		
		await current_tween.finished
		
		editing = false
		#I WILL CRYYYY
