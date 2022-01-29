extends Control

onready var container = $CenterContainer
onready var anim_player = $AnimationPlayer
onready var label = $CenterContainer/Label

signal popup_finished

func _ready():
	container.rect_scale = Vector2(0.0,0.0)
	#_play()

func _play():
	if Global.won_last_game:
		label.text = "УСПЕХ!"
	else:
		label.text = "НЕУДАЧА!"
	anim_player.play("Show up")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("popup_finished")
