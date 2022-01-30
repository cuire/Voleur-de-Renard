extends Node2D

onready var popup = $Popup
onready var current_frame = $CurrentFrame
onready var next_frame = $NextFrame
onready var prince = $Prince
onready var counter = $Control/MoneyCounter
onready var counter_time = $Control/MoneyCounter2
onready var viewport_size: float = get_viewport().size.x
var current_position: float = 0
var new_frame
onready var timer = $Timer
onready var timer_counter = $TimerCounter
var time_left

onready var frame_1 = preload("res://scenes/main_location/frames/frame_1.tscn")

onready var bakery = preload("res://minigames/bakery/bakery.tscn")
onready var goose = preload("res://minigames/goose/goose.tscn")
onready var vending_machine = preload("res://minigames/pull_the_handle/vending_machine.tscn")
onready var obstacles = [bakery, goose, vending_machine]

const DIRECTION: int = -1
export var velocity: float = 1.5 * DIRECTION

func _process(delta: float) -> void:
	new_frame = populate_frame(frame_1.instance())
	current_position += velocity * delta * DIRECTION
	_move_frame(new_frame, delta)

# Function to move frame
func _move_frame(next_frame_to_render: Node2D, delta) -> void:
	# Move frames
	current_frame.position.x += velocity * delta
	next_frame.position.x += velocity * delta
	# Try to reposition the frame
	if viewport_size * DIRECTION > current_frame.position.x:
		remove_child(current_frame)
		add_child(next_frame_to_render)
		move_child(next_frame_to_render, 1)
		current_frame = next_frame
		next_frame = next_frame_to_render
		next_frame.position.x = viewport_size

func add_obstacle(frame: Node2D, obstacle: Minigame, region: int):
	obstacle.position = Vector2(randi()%300*region+150*region, randi()%200*region+250)
	var _status = obstacle.connect("steal_money", prince, "_on_Steal_Money")
	frame.add_child(obstacle)

func populate_frame(frame: Node2D):
	var obstacle: Minigame

	for _i in range(3):
		obstacle = get_random_minigame().instance()
		add_obstacle(frame, obstacle, _i+1)
	
	return frame
	

func get_random_minigame():
	var index = randi() % obstacles.size()

	if index == 0:
		return bakery
	elif index == 1:
		return goose
	elif index == 2:
		return vending_machine

	return goose
	# return obstacles[randi() % obstacles.size()].instance()

func _ready():
	GlobalAudioStreamPlayer.play_game_music()
	var _money_status = prince.connect("signal_lost_money", self, "_update_counter")
	counter._settext(prince._money)
	if Global.current_difficulty:
		time_left = Global.TIME_TO_STEAL
		timer.set_wait_time(time_left)
		timer.start()
		timer_counter.start()
		self._update_time_counter()
	else:
		counter_time.visible = false
	current_frame = populate_frame(current_frame)
	next_frame = populate_frame(next_frame)
	
func _update_counter():
	counter._settext(prince._money)
	if (prince._money <=0):
		prince._money = 0
		counter._settext(prince._money)
		_show_popup(true)
	
	
	
func _update_time_counter():
	time_left -= 1
	counter_time._settext(time_left)
	
	
func _on_Timer_timeout():
	_show_popup(false)
	print("timeout")
	
func _show_popup(condition):
	timer_counter.stop()
	timer.stop()
	Global.won_last_game = condition
	var _await_popup = popup.connect("popup_finished", self, "_end_game")
	popup._play()
	#get_tree().paused = true
	
	
func _end_game():
	GlobalAudioStreamPlayer.stop_music()
	get_tree().change_scene("res://scenes/briefing_scenes/briefing_end.tscn")


func _on_TimerCounter_timeout():
	_update_time_counter()
