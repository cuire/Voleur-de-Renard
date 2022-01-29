extends Minigame

#var symbols = [get_node("Sprite/Symbol"),get_node("Sprite/Symbol2"),get_node("Sprite/Symbol3"),get_node("Sprite/Symbol4"),get_node("Sprite/Symbol5")]
var symbols = ["Sprite/Symbol","Sprite/Symbol2","Sprite/Symbol3"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#randomize()
	#symbols.shuffle()
	get_node(symbols[0]).flip_symbol(true)
	get_node(symbols[1]).flip_symbol(true)
	get_node(symbols[2]).flip_symbol(true)
	#symbols[0].flip_symbol(true)
	#symbols[1].flip_symbol(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
