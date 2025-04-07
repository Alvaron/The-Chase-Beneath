extends GPUParticles3D

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $StaticBody3D/AudioStreamPlayer3D

func _process(delta: float) -> void:
	if !OverheadScript.tasks["level2_steamhazard"]:
		queue_free()
	
	if !audio_stream_player_3d.is_playing():
		audio_stream_player_3d.play()
