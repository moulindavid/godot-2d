extends CharacterBody2D

const SPEED = 300.0
const ATTACK_DAMAGE = 1
@onready var sprite = $AnimatedSprite2D
@onready var attack_area = $AttackArea

var is_attacking = false # A "state" variable
var hit_bodies = [] # Tracks which enemies were already hit this attack

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

	attack_area.look_at(get_global_mouse_position())

	# ATTACK TRIGGER
	if Input.is_action_just_pressed("mouse_left_click") and not is_attacking:
		perform_attack()

	# Deal damage when attack area physically overlaps an enemy (once per enemy per attack)
	if is_attacking:
		for body in attack_area.get_overlapping_bodies():
			if body.has_method("take_damage") and body not in hit_bodies:
				body.take_damage(ATTACK_DAMAGE)
				hit_bodies.append(body)

	# ANIMATION CONTROLLER
	if is_attacking:
		sprite.rotation = attack_area.rotation
	else:
		sprite.rotation = 0.0
		sprite.play("idle")


func perform_attack():
	is_attacking = true
	hit_bodies.clear()
	sprite.play("attack")


# This is the signal function - make sure it is connected!
func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false # Reset the state
		hit_bodies.clear()
		sprite.play("idle")
