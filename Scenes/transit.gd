extends Area3D

@export var to_level:String

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		OverheadScript.main_node.get_child(0).queue_free()
		var screen_between = OverheadScript.loading_screen.instantiate()
		OverheadScript.main_node.add_child(screen_between)
		screen_between.load_to_level(to_level)
