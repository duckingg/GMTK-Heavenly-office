extends Panel

var hover_tween: Tween

var original_scale = $".".scale
var original_pos = $".".global_position

func _on_mouse_entered() -> void:
	if hover_tween:
		hover_tween.kill()

	hover_tween = create_tween()
	hover_tween.tween_property(self, "scale", 2 * original_scale , 0.15)


func _on_mouse_exited() -> void:
	if hover_tween:
		hover_tween.kill()

	hover_tween = create_tween()
	hover_tween.tween_property(self, "scale", original_scale, 0.15)
