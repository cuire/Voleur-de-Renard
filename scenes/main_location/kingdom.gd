extends Node2D

onready var current_frame = $CurrentFrame
onready var next_frame = $NextFrame
onready var prince = $Prince
onready var counter = $Control/MoneyCounter
onready var viewport_size: float = get_viewport().size.x
var current_position: float = 0

var bakery = preload("res://minigames/bakery/bakery.tscn")

const DIRECTION: int = -1
export var velocity: float = 1.5 * DIRECTION

func _process(delta: float) -> void:
	current_position += velocity * delta * DIRECTION
	_move_frame(current_frame, delta)
	_move_frame(next_frame, delta)
	if Input.is_action_pressed("ui_right"):
		add_obstacle(next_frame, bakery.instance())

# Function to move frame
func _move_frame(frame: Node2D, delta) -> void:
	# Move frame
	frame.position.x += velocity * delta
	# Try to reposition the frame
	if viewport_size * DIRECTION > frame.position.x:
		frame.position.x += 2 * viewport_size

func add_obstacle(frame: Node2D, obstacle: Minigame):
	obstacle.position = Vector2(randi()%900+100, randi()%600+250)
	# check if any collisions

	print("Added")
	var _status = obstacle.connect("steal_money", prince, "_on_Steal_Money")
	frame.add_child(obstacle)

func _ready():
	var _money_status = prince.connect("signal_lost_money", self, "_update_counter")
	counter._settext(prince._money)
	
func _update_counter():
	counter._settext(prince._money)
