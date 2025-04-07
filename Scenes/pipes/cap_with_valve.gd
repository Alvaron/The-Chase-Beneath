extends StaticBody3D

var open:bool = true
var locked:bool = false
@export var useable:bool = true
@export var target:String = ""
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func interact() -> void:
	print(OverheadScript.tasks[target])
	if open:
		animation_player.play("turn_valve")
		open = false
		OverheadScript.tasks[target] = false
		useable = false
		print(OverheadScript.tasks[target])

func is_useable() -> bool:
	return useable
