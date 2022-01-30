extends Control

onready var fader = $Fader
func _ready():
	fader.fade_out()
	

func _on_ButtonReturn_pressed():
	fader.connect("faded_in",self,"return_to_menu")
	fader.fade_in()


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
	fader.connect("faded_in",self,"start_briefing")
	fader.fade_in()
	#print("Starting up easy difficulty")
	
func setup_medium_game():
	Global.current_difficulty = true
	fader.connect("faded_in",self,"start_briefing")
	fader.fade_in()
	#print("Starting up medium difficulty")
	
func start_briefing():
	get_tree().change_scene("res://scenes/briefing_scenes/briefing_start.tscn")
	#fader.disconnect("faded_in",self,"start_difficulty_selection")

func return_to_menu():
	get_tree().change_scene("res://scenes/main_menu/menu.tscn")
	#fader.disconnect("faded_in",self,"return_to_menu")
