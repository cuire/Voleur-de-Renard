extends KinematicBody2D
class_name GravityBody2D

export var speed = Vector2(250.0, 350.0)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

var _velocity = Vector2.ZERO

# This allows scenes to be affected by gravity.
func _physics_process(delta):
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity)
