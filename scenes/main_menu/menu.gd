extends Control

onready var fader = $Fader
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
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
