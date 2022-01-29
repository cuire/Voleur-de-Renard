extends Minigame

var _velocity = Vector2.ZERO
var is_moving: bool = false
export var speed: int = 10

func _physics_process(delta: float) -> void:
	if is_moving:
		_velocity = get_local_mouse_position().normalized()
		self.rotate( _velocity.x * speed * delta )

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT 
		and !event.pressed and is_moving):
			is_moving = false

func _on_Handle_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		is_moving = event.pressed

func drop_candy():
	activate()
	print("YOU drop that candy, that means you must pay for it")
	set_physics_process(false)
