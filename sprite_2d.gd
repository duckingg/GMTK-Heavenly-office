extends Sprite2D

var second = 0
var time = 60

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
		if time <= 50:
			current_tween.set_trans(Tween.TRANS_ELASTIC)
		else:
			current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			$Sprite2D,
			"rotation",
			deg_to_rad(time * 6),
			1
		)
		print(time)
		
	elif type == "edit":
		current_tween.set_trans(Tween.TRANS_LINEAR)
		
		current_tween.tween_property(
			$Sprite2D,
			"rotation",
			deg_to_rad(time * 6),
			0.5
		)
		#I WILL CRYYYY123
