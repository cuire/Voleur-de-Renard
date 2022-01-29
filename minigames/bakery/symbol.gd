tool

extends Area2D

signal symbol_flipped

export(StreamTexture) var Asset setget _setup_symbol
export(bool) var is_flipped = true #setget flip_symbol

func _setup_symbol(tex):
	Asset = tex
	get_node("Sprite").texture = Asset
	
func flip_symbol(to_flip):
	is_flipped = to_flip
	get_node("Sprite").set_flip_h(is_flipped)
	emit_signal("symbol_flipped")


func _ready():
	pass # Replace with function body.


func _on_Symbol_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		#flip_symbol(not is_flipped)
		flip_symbol(false)
