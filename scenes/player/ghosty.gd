extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	if direction.x != 0:
		$AnimatedSprite2D.flip_h = direction.x < 0

	move_and_slide()
