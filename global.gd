extends Node


var current_difficulty = true
# false == easy
# true == medium

var TIME_TO_STEAL = 5
var won_last_game = false


func _ready():
	current_difficulty = true


