extends Node2D
class_name Minigame

export var money_to_steal: int = 0
signal steal_money(amount, sender)

func activate():
	emit_signal("steal_money", money_to_steal, self)