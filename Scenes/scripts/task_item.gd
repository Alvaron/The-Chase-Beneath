extends StaticBody3D

@export var codename:String = ""

func interact(body) -> void:
	body.equiped.append(codename)
	call_deferred("queue_free")
