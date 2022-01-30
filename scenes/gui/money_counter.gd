extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var text
export(Texture) var icon

onready var image_icon = $Background/CenterContainer2/Coin
# Called when the node enters the scene tree for the first time.
func _ready():
	image_icon.texture = icon

func _settext(txt):
	text = txt
	get_node("Background/CenterContainer/Text").text = String(text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
