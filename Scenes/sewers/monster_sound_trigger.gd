extends Area3D

var random_timer:float = 0.0
var triggerable:bool = true

@onready var audio1: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var audio2: AudioStreamPlayer3D = $AudioStreamPlayer3D2
@onready var audio3: AudioStreamPlayer3D = $AudioStreamPlayer3D3

func _process(delta: float) -> void:
	random_timer -= delta
	if random_timer < 0.0:
		triggerable = true

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if triggerable:
			randomize()
			var rnd_sound:int = randi_range(1,3)
			match rnd_sound:
				1:
					audio1.play()
				2:
					audio2.play()
				3:
					audio3.play()
			triggerable = false
			randomize()
			random_timer = randf_range(6.0, 15.0)
		
		
