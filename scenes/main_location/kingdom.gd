extends Node2D

onready var popup = $Popup
onready var current_frame = $CurrentFrame
onready var next_frame = $NextFrame
onready var prince = $Prince
onready var counter = $Control/MoneyCounter
onready var viewport_size: float = get_viewport().size.x
var current_position: float = 0
var new_frame
onready var timer = get_node("Timer")

var frame_1 = preload("res://scenes/main_location/frames/frame_1.tscn")
var bakery = preload("res://minigames/bakery/bakery.tscn")

const DIRECTION: int = -1
export var velocity: float = 1.5 * DIRECTION

func _process(delta: float) -> void:
	new_frame = frame_1.instance()
	current_position += velocity * delta * DIRECTION
	_move_frame(new_frame, delta)
	if Input.is_action_pressed("ui_right"):
		add_obstacle(next_frame, bakery.instance())

# Function to move frame
func _move_frame(next_frame_to_render: Node2D, delta) -> void:
	# Move frames
	current_frame.position.x += velocity * delta
	next_frame.position.x += velocity * delta
	# Try to reposition the frame
	if viewport_size * DIRECTION > current_frame.position.x:
		remove_child(current_frame)
		add_child(next_frame_to_render)
		move_child(next_frame_to_render, 0)
		current_frame = next_frame
		next_frame = next_frame_to_render
		next_frame.position.x = viewport_size

func add_obstacle(frame: Node2D, obstacle: Minigame):
	obstacle.position = Vector2(randi()%900+100, randi()%600+250)
	var _status = obstacle.connect("steal_money", prince, "_on_Steal_Money")
	frame.add_child(obstacle)

func _ready():
	var _money_status = prince.connect("signal_lost_money", self, "_update_counter")
	counter._settext(prince._money)
	if Global.current_difficulty:
		timer.set_wait_time(Global.TIME_TO_STEAL)
		timer.start()
	
func _update_counter():
	counter._settext(prince._money)
	
func _on_Timer_timeout():
	_show_popup(false)
	print("timeout")
	
func _show_popup(condition):
	timer.stop()
	Global.won_last_game = condition
	var _await_popup = popup.connect("popup_finished", self, "_end_game")
	popup._play()
	
func _end_game():
	get_tree().change_scene("res://scenes/briefing_scenes/briefing_end.tscn")
