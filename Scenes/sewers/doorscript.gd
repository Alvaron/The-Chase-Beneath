extends StaticBody3D

@export var useable:bool = false
@export var rotationY:float = 0.0

var position_closed:bool = true
var startrotation:Vector3
var endrotation:Vector3

func _ready() -> void:
	startrotation = rotation_degrees
	endrotation = startrotation
	endrotation.y = startrotation.y - 90

func _process(delta: float) -> void:
	if position_closed:
		if rotation_degrees != startrotation:
			rotation_degrees = startrotation 
	else:
		if rotation_degrees != endrotation:
			print("I should open")
			rotation_degrees = endrotation

func interact() -> void:
	if useable:
		position_closed = !position_closed

func is_useable() -> bool:
	return useable
