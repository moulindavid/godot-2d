extends CharacterBody2D

const BAR_WIDTH = 44
const BAR_HEIGHT = 6
const BAR_OFFSET = Vector2(-BAR_WIDTH / 2.0, -60)

var MAX_HP = 3
var hp : int

func _ready():
	hp = MAX_HP
func take_damage(amount: int):
	hp -= amount
	print("Enemy hit! HP: ", hp, "/", MAX_HP)
	queue_redraw()
	if hp <= 0:
		die()

func die():
	print("Enemy destroyed!")
	queue_free()
		
func _draw():
	# background
	draw_rect(Rect2(BAR_OFFSET, Vector2(BAR_WIDTH, BAR_HEIGHT)), Color.BLACK)
	# fill proportional to current hp
	var fill = BAR_WIDTH * (float(hp) / float(MAX_HP))
	draw_rect(Rect2(BAR_OFFSET, Vector2(fill, BAR_HEIGHT)), Color.RED)
