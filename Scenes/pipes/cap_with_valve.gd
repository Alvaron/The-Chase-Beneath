extends StaticBody3D

var open:bool = true
var locked:bool = false
@export var useable:bool = true
@export var target:String = ""
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func interact() -> void:
	if open:
		animation_player.play("turn_valve")
		open = false
		OverheadScript.tasks[target] = false
		useable = false
		get_node("Area3D").queue_free()

func is_useable() -> bool:
	return useable
