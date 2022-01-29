extends Node2D

var _money = 30

func lost_money(amount: int):
    print("Oh noh I lost some money")
    _money -= amount

func _on_Steal_Money(amount: int, _sender):
    lost_money(amount)