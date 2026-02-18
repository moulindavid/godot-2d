extends CharacterBody2D

const MAX_HP = 3
var hp = MAX_HP

const BAR_OFFSET = Vector2(227, 180)
const BAR_SIZE = Vector2(44, 6)

func take_damage(amount: int):
	hp -= amount
	print("Blobby hit! HP: ", hp, "/", MAX_HP)
	queue_redraw()
	if hp <= 0:
		die()

func die():
	print("Blobby destroyed!")
	queue_free()

func _draw():
	var bar_pos = BAR_OFFSET - Vector2(BAR_SIZE.x / 2.0, 0)
	# Background
	draw_rect(Rect2(bar_pos, BAR_SIZE), Color(0, 0, 0, 0.7))
	# HP fill
	var fill_width = BAR_SIZE.x * (float(hp) / float(MAX_HP))
	draw_rect(Rect2(bar_pos, Vector2(fill_width, BAR_SIZE.y)), Color.RED)
