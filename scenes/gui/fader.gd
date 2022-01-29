extends Control

onready var anim_player = $AnimationPlayer

signal faded_in
signal faded_out


func _ready():
	pass # Replace with function body.

func fade_in():
	anim_player.play("fade_in")
	
func fade_out():
	anim_player.play("fade_out")



func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "fade_in"):
		emit_signal("faded_in")
	elif (anim_name == "fade_out"):
		emit_signal("faded_out")
	
