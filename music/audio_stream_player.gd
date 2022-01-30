extends AudioStreamPlayer


var audio_stream_menu : AudioStream = preload("res://music/Bossa-Antigua.mp3")
var audio_stream_game : AudioStream = preload("res://music/HinaCC0_011_Fallen_leaves.mp3")
var is_playing : String

onready var anim_player = $AnimationPlayer
signal faded_down
signal faded_up

func _ready():
	is_playing = "none"

func fade_down():
	anim_player.play("fade_music_down")
	
func fade_up():
	anim_player.play("fade_music_up")

func stop_music():
	fade_down()
	self.stop()
	is_playing = "none"

func play_menu_music():
	self.fade_down()
	self.stop()
	self.stream = audio_stream_menu
	self.play()
	self.fade_up()
	is_playing = "menu"
	
func play_game_music():
	self.fade_down()
	self.stop()
	self.stream = audio_stream_game
	self.play()
	self.fade_up()
	is_playing = "game"
