extends Node2D

onready var current_frame = $CurrentFrame
onready var next_frame = $NextFrame
onready var viewport_size: float = get_viewport().size.x
var current_position : Vector2 = Vector2.ZERO

const DIRECTION: int = -1
export var velocity: float = 1.5 * DIRECTION

func _process(_delta: float) -> void:
	_move_frame(current_frame)
	_move_frame(next_frame)

# Function to move frame
func _move_frame(frame: Node2D) -> void:
	# Move frame
	frame.position.x += velocity
	# Try to reposition the frame
	if viewport_size * DIRECTION > frame.position.x:
		frame.position.x += 2 * viewport_size
