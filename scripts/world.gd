extends Node2D

@onready var blobby_template = $Blobby

func _ready():
	for i in range(9):
		var blobby = blobby_template.duplicate()
		blobby.position = Vector2(randf_range(100, 700), randf_range(100, 500))
		add_child(blobby)
