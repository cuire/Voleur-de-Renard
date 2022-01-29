extends Minigame

onready var area_2d = $Area2D
onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("sleep")

func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		activate()

func activate():
	.activate()
	animation_player.play("awake")
	area_2d.disconnect("input_event", self, "_on_Area2D_input_event")
	print("Goose want that shiny")
