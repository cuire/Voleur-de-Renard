extends Control

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
	print("Starting up easy difficulty")
	
func setup_medium_game():
	print("Starting up medium difficulty")
