extends StaticBody3D

@export var useable:bool = false
@export var oneshot:bool = false
@export var locked:bool = false
@export var locked_required:String = ""

var position_closed:bool = true
var startrotation:Vector3
var endrotation:Vector3

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _ready() -> void:
	startrotation = rotation_degrees
	endrotation = startrotation
	endrotation.y = startrotation.y - 90

func _process(delta: float) -> void:
	if position_closed:
		if rotation_degrees != startrotation:
			audio_stream_player_3d.play()
			rotation_degrees = startrotation 
	else:
		if rotation_degrees != endrotation:
			audio_stream_player_3d.play()
			rotation_degrees = endrotation

func interact() -> void:
	if useable:
		position_closed = !position_closed
		if oneshot:
			useable = false

func is_useable() -> bool:
	return useable
