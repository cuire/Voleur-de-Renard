extends Control

onready var fader = $Fader
onready var button_sound = $Control/CenterContainer/ButtonSound
onready var slider_sound = $VBoxContainer/HBoxContainer/CenterContainer2/HSlider
var is_sound_toggled = false

func _ready():
	if GlobalAudioStreamPlayer.is_playing != "menu":
		GlobalAudioStreamPlayer.play_menu_music()
	fader.fade_out()
	var await_fader_in = fader.connect("faded_in",self,"start_difficulty_selection")

func _on_ButtonNewGame_pressed():
	fader.fade_in()
	
	
func start_difficulty_selection():
	get_tree().change_scene("res://scenes/main_menu/difficulty_selection.tscn")

func _on_ButtonExit_pressed():
	get_tree().quit()


#func _on_ButtonSound_pressed():
#	AudioServer.set_bus_volume_db()


func _on_HSlider_value_changed(value):
	if not is_sound_toggled:
		var setval = value
		if setval <= -29:
			setval = -80
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),setval)



func _on_ButtonSound_toggled(button_pressed):
	if button_pressed:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-80)
		is_sound_toggled = true
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),slider_sound.value)
		is_sound_toggled = false
