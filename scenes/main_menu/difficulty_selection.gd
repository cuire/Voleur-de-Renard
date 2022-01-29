extends Control

onready var globals = get_node("res://global.gd")

func _ready():
	pass # Replace with function body.

func _on_ButtonReturn_pressed():
	get_tree().change_scene("res://scenes/main_menu/menu.tscn")


func _on_LabelEasy_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		setup_easy_game()

func _on_ButtonEasy_pressed():
	setup_easy_game()

func _on_LabelMedium_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		setup_medium_game()

func _on_ButtonMedium_pressed():
	setup_medium_game()


func setup_easy_game():
	Global.current_difficulty = false
	#globals.current_difficulty = false
	 #current_difficulty = Difficulty.EASY
	get_tree().change_scene("res://scenes/briefing_scenes/briefing_start.tscn")
	#print("Starting up easy difficulty")
	
func setup_medium_game():
	Global.current_difficulty = true
	get_tree().change_scene("res://scenes/briefing_scenes/briefing_start.tscn")
	print("Starting up medium difficulty")
