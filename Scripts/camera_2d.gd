extends Camera2D

var focus = false
var focus_tween : Tween
var OG_pos = $".".global_position

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and focus == false:
			if focus_tween:
				focus_tween.kill()
			
			focus_tween = create_tween()
			focus_tween.set_trans(Tween.TRANS_SINE)
			focus_tween.set_ease(Tween.EASE_IN_OUT)
			focus_tween.tween_property(self, "position", get_global_mouse_position(), 0.5)
			focus_tween.parallel()
			focus_tween.tween_property(self, "zoom", Vector2(2,2), 0.5)
			focus = true
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and focus == true:
			if focus_tween:
				focus_tween.kill()
			
			focus_tween = create_tween()
			focus_tween.set_trans(Tween.TRANS_SINE)
			focus_tween.set_ease(Tween.EASE_IN_OUT)
			focus_tween.tween_property(self, "position", OG_pos, 0.5)
			focus_tween.parallel()
			focus_tween.tween_property(self, "zoom", Vector2(1,1), 0.5)
			focus = false
