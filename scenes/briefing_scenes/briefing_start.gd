extends Control


onready var fader = $Fader
onready var light = $Light2D
onready var anim_player = $AnimationPlayer

func _ready():
	light.visible = false
	fader.connect("faded_out",self,"start_scrolling")
	fader.fade_out()
	
	#print(Global.current_difficulty)

func start_scrolling():
	light.visible = true
	anim_player.play("scroll_brief_text")

func _on_AnimationPlayer_animation_finished(anim_name):
	pass


func _on_Background_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		anim_player.playback_speed = 10.0
	else:
		anim_player.playback_speed = 1.0


func _on_ButtonStart_pressed():
	fader.connect("faded_in",self,"start_game")
	light.visible = false
	fader.fade_in()
func start_game():
	get_tree().change_scene("res://scenes/main_location/kingdom.tscn")
