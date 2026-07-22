extends Sprite2D

@export var Tick_start_time = 30
@export var scale_start_time = 15

var second = 0
var time = 60.0

var current_tween : Tween

func _process(delta):
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



func time_update(type):
	if current_tween:
		current_tween.kill()

	current_tween = create_tween()

	if type == "normal":
		if time <= Tick_start_time:
			current_tween.set_trans(Tween.TRANS_ELASTIC)
		else:
			current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			$Second_hand,
			"rotation",
			deg_to_rad(time * 6),
			1
		)
		
		if time <= scale_start_time and time != 0:
			current_tween.parallel()
			current_tween.tween_property(
				self,
				"scale",
				Vector2( scale_start_time/time , scale_start_time/time ),
				1
			)
		
		print(time)
		
	elif type == "edit":
		current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			$Second_hand,
			"rotation",
			deg_to_rad(time * 6),
			0.5
		)
		#I WILL CRYYYY
