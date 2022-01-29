extends Minigame

#var symbols = [get_node("Sprite/Symbol"),get_node("Sprite/Symbol2"),get_node("Sprite/Symbol3"),get_node("Sprite/Symbol4"),get_node("Sprite/Symbol5")]
var symbols = ["Sprite/Symbol","Sprite/Symbol2","Sprite/Symbol3"]


func _ready():
	#randomize()
	#symbols.shuffle()
	get_node(symbols[0]).flip_symbol(true)
	get_node(symbols[1]).flip_symbol(true)
	get_node(symbols[2]).flip_symbol(true)
	#symbols[0].flip_symbol(true)
	#symbols[1].flip_symbol(true)



func _on_Symbol_symbol_flipped():
	check_symbols()

func _on_Symbol2_symbol_flipped():
	check_symbols()

func _on_Symbol3_symbol_flipped():
	check_symbols()

func check_symbols():
	for symbol in symbols:
		print(get_node(symbol).is_flipped)
		if get_node(symbol).is_flipped:
			return
	print("bakery activated")
