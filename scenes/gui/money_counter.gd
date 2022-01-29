extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var text


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _settext(txt):
	text = txt
	get_node("Background/CenterContainer/Text").text = String(text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
