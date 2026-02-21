extends Node2D

const BLOBBY_SCENE = preload("res://scenes/enemies/blobby.tscn")

func _ready():
	for i in range(9):
		var blobby = BLOBBY_SCENE.instantiate()
		blobby.position = Vector2(randf_range(100, 700), randf_range(100, 500))
		add_child(blobby)
