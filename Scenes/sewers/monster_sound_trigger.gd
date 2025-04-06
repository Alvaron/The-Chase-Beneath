extends Area3D

var random_timer:float = 0.0
var triggerable:bool = true

@onready var audio1: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var audio2: AudioStreamPlayer3D = $AudioStreamPlayer3D2
@onready var audio3: AudioStreamPlayer3D = $AudioStreamPlayer3D3

func _on_body_entered(body: Node3D) -> void:
	print("I'm touched!")
	if body.is_in_group("player"):
		print("By the player!")
		randomize()
		var rnd_sound:int = randi_range(1,3)
		print("playing " + str(rnd_sound))
		match rnd_sound:
			1:
				audio1.play()
			2:
				audio2.play()
			3:
				audio3.play()
		
		
