extends Area2D

func _on_Area2D_body_entered(body: Node):
	if body.has_method("drop_candy"):
		body.drop_candy()
