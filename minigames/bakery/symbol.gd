tool

extends Area2D


export(Texture) var asset setget _myfunc
export(bool) var is_flipped setget flip_symbol

func _myfunc(tex):
	asset = tex
	get_node("Sprite").Texture = asset
	
func flip_symbol(to_flip):
	is_flipped = to_flip
	get_node("Sprite").set_flip_h(is_flipped)
	#get_node("Sprite").set_scale(Vector2(-1 if is_flipped else 1,1))



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Symbol_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		flip_symbol(not is_flipped)
