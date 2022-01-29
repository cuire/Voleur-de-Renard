extends Area2D

var : bool is_moving = false

func _process(_delta):
	if is_moving:
		position = get_global_mouse_position()

