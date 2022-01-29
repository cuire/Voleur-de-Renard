extends Node2D

onready var current_frame = $CurrentFrame
onready var next_frame = $NextFrame
onready var viewport_size: float = get_viewport().size.x
var current_position : int = 0

const DIRECTION: int = -1
export var velocity: float = 1.5 * DIRECTION

func _process(delta: float) -> void:
	current_position += velocity * delta * DIRECTION
	print(current_position)
	_move_frame(current_frame, delta)
	_move_frame(next_frame, delta)

# Function to move frame
func _move_frame(frame: Node2D, delta) -> void:
	# Move frame
	frame.position.x += velocity * delta
	# Try to reposition the frame
	if viewport_size * DIRECTION > frame.position.x:
		frame.position.x += 2 * viewport_size
