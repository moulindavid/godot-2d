extends CharacterBody2D

const SPEED = 300.0
const ATTACK_DAMAGE = 1
@onready var sprite = $AnimatedSprite2D
@onready var attack_area = $AttackArea

var is_attacking = false # A "state" variable

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

	attack_area.look_at(get_global_mouse_position())

	# ATTACK TRIGGER
	if Input.is_action_just_pressed("mouse_left_click") and not is_attacking:
		perform_attack()

	# ANIMATION CONTROLLER
	if not is_attacking:
		sprite.play("idle")


func perform_attack():
	is_attacking = true
	sprite.play("attack")

	# Cleave logic
	var overlapping_bodies = attack_area.get_overlapping_bodies()
	for body in overlapping_bodies:
		if body.has_method("take_damage"):
			body.take_damage(ATTACK_DAMAGE)

# This is the signal function - make sure it is connected!
func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false # Reset the state
		sprite.play("idle")
