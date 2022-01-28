extends Control

func _ready():
	pass # Replace with function body.

func _on_ButtonNewGame_pressed():
	var gui_difficulty_selection = load("res://scenes/main_menu/difficulty_selection.tscn").instance()
	get_tree().current_scene.add_child(gui_difficulty_selection)
	# show difficulty selection gui
	# get_tree().change_scene("res://scenes/main_location/kingdom.tscn")
	pass # Replace with function body.

func _on_ButtonExit_pressed():
	get_tree().quit()
