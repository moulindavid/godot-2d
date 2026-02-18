extends CharacterBody2D

func die():
	print("Enemy destroyed by left-click!")
	queue_free()
