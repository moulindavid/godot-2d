extends CharacterBody2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			die()

func die():
	print("Enemy destroyed by right-click!")
	queue_free()
