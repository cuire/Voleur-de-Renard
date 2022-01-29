extends Minigame

var symbols = ["Sprite/Symbol","Sprite/Symbol2","Sprite/Symbol3"]


func _ready():
	get_node(symbols[0]).flip_symbol(true)
	get_node(symbols[1]).flip_symbol(true)
	get_node(symbols[2]).flip_symbol(true)

func _on_Symbol_symbol_flipped():
	check_symbols()

func _on_Symbol2_symbol_flipped():
	check_symbols()

func _on_Symbol3_symbol_flipped():
	check_symbols()

func check_symbols():
	for symbol in symbols:
		if get_node(symbol).is_flipped:
			return
	activate()

func activate():
	.activate()
	print("Bakery Is moving. Bakery is growing")
