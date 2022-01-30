extends Control

onready var fader = $Fader
onready var light = $Light2D
onready var anim_player = $AnimationPlayer
onready var label = $Background/Control/CenterContainer/Label
onready var string_win = """У принца кошелёк большой,
Да я хитёр. Теперь он мой.
Приятель, ты мне удружил
И половину заслужил.
Теперь богаты мы с тобой,
Давай закатим пир горой!
"""
onready var string_lose = """Свои богатства принц унёс,
Утёр он нам с тобою нос.
А впрочем, хватит унывать,
Ещё, кого обворовать,
Найдём легко, ведь, как известно,
Богатых много в королевстве.
"""

func _ready():
	if GlobalAudioStreamPlayer.is_playing != "menu":
		GlobalAudioStreamPlayer.play_menu_music()
	light.visible = false
	fader.connect("faded_out",self,"start_scrolling")
	fader.fade_out()
	
	

func start_scrolling():
	light.visible = true
	if Global.won_last_game:
		label.text = string_win
	else:
		label.text = string_lose
	anim_player.play("scroll_brief_text")


func _on_Background_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		anim_player.playback_speed = 10.0
	else:
		anim_player.playback_speed = 1.0


func _on_ButtonEnd_pressed():
	fader.connect("faded_in",self,"return_to_menu")
	light.visible = false
	fader.fade_in()
	
func return_to_menu():
	get_tree().change_scene("res://scenes/main_menu/menu.tscn")


func _on_Button_pressed():
	anim_player.playback_speed = 100.0
