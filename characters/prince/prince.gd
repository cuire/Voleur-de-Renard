extends Node2D

var _money = 100

signal signal_lost_money

func lost_money(amount: int):
	print("Oh noh I lost some money")
	_money -= amount
	emit_signal("signal_lost_money")

func _on_Steal_Money(amount: int, _sender):
	if position.x < _sender.global_position.x:
		lost_money(amount)
