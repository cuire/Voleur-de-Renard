extends Control

func _ready():
	pass # Replace with function body.

func _on_ButtonReturn_pressed():
	queue_free()




func _on_LabelEasy_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		print("Starting up easy difficulty")




func _on_ButtonEasy_pressed():
	print("Starting up easy difficulty")


func _on_ButtonMedium_pressed():
	print("Starting up medium difficulty")


func _on_LabelMedium_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		print("Starting up medium difficulty")
