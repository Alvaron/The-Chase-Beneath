extends CharacterBody3D

var speed:float = 30.0

@onready var audio1: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var audio2: AudioStreamPlayer3D = $AudioStreamPlayer3D2

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var ray_cast_3d_2: RayCast3D = $RayCast3D2
@onready var ray_cast_3d_3: RayCast3D = $RayCast3D3
@onready var ray_cast_3d_4: RayCast3D = $RayCast3D4
@onready var ray_cast_3d_5: RayCast3D = $RayCast3D5
@onready var ray_cast_3d_6: RayCast3D = $RayCast3D6
@onready var ray_cast_3d_7: RayCast3D = $RayCast3D7
@onready var ray_cast_3d_8: RayCast3D = $RayCast3D8
@onready var ray_cast_3d_9: RayCast3D = $RayCast3D9
@onready var ray_cast_3d_10: RayCast3D = $RayCast3D10
@onready var ray_cast_3d_11: RayCast3D = $RayCast3D11
@onready var ray_cast_3d_12: RayCast3D = $RayCast3D12
@onready var ray_cast_3d_13: RayCast3D = $RayCast3D13
@onready var ray_cast_3d_14: RayCast3D = $RayCast3D14
@onready var ray_cast_3d_15: RayCast3D = $RayCast3D15
@onready var ray_cast_3d_16: RayCast3D = $RayCast3D16
@onready var ray_cast_3d_17: RayCast3D = $RayCast3D17
@onready var ray_cast_3d_18: RayCast3D = $RayCast3D18
@onready var ray_cast_3d_19: RayCast3D = $RayCast3D19
@onready var ray_cast_3d_20: RayCast3D = $RayCast3D20
@onready var ray_cast_3d_21: RayCast3D = $RayCast3D21
@onready var ray_cast_3d_22: RayCast3D = $RayCast3D22
@onready var ray_cast_3d_23: RayCast3D = $RayCast3D23
@onready var ray_cast_3d_24: RayCast3D = $RayCast3D24
@onready var ray_cast_3d_25: RayCast3D = $RayCast3D25
@onready var ray_cast_3d_26: RayCast3D = $RayCast3D26
@onready var ray_cast_3d_27: RayCast3D = $RayCast3D27
@onready var ray_cast_3d_28: RayCast3D = $RayCast3D28
@onready var ray_cast_3d_29: RayCast3D = $RayCast3D29
@onready var ray_cast_3d_30: RayCast3D = $RayCast3D30
@onready var ray_cast_3d_31: RayCast3D = $RayCast3D31
@onready var ray_cast_3d_32: RayCast3D = $RayCast3D32
@onready var ray_cast_3d_33: RayCast3D = $RayCast3D33
@onready var ray_cast_3d_34: RayCast3D = $RayCast3D34
@onready var ray_cast_3d_35: RayCast3D = $RayCast3D35
@onready var ray_cast_3d_36: RayCast3D = $RayCast3D36
@onready var ray_cast_3d_37: RayCast3D = $RayCast3D37
@onready var ray_cast_3d_38: RayCast3D = $RayCast3D38
@onready var ray_cast_3d_39: RayCast3D = $RayCast3D39
@onready var ray_cast_3d_40: RayCast3D = $RayCast3D40
@onready var ray_cast_3d_41: RayCast3D = $RayCast3D41
@onready var ray_cast_3d_42: RayCast3D = $RayCast3D42
@onready var ray_cast_3d_43: RayCast3D = $RayCast3D43
@onready var ray_cast_3d_44: RayCast3D = $RayCast3D44
@onready var ray_cast_3d_45: RayCast3D = $RayCast3D45
@onready var ray_cast_3d_46: RayCast3D = $RayCast3D46
@onready var ray_cast_3d_47: RayCast3D = $RayCast3D47
@onready var ray_cast_3d_48: RayCast3D = $RayCast3D48
@onready var rays:Array = [ray_cast_3d, ray_cast_3d_2, ray_cast_3d_3, ray_cast_3d_4, 
ray_cast_3d_5, ray_cast_3d_6, ray_cast_3d_7, ray_cast_3d_8, ray_cast_3d_9, 
ray_cast_3d_10, ray_cast_3d_11, ray_cast_3d_12, ray_cast_3d_13, ray_cast_3d_14, 
ray_cast_3d_15, ray_cast_3d_16, ray_cast_3d_17, ray_cast_3d_18, ray_cast_3d_19, 
ray_cast_3d_20, ray_cast_3d_21, ray_cast_3d_22, ray_cast_3d_23, ray_cast_3d_24, 
ray_cast_3d_25, ray_cast_3d_26, ray_cast_3d_27, ray_cast_3d_28, ray_cast_3d_29, 
ray_cast_3d_30, ray_cast_3d_31, ray_cast_3d_32, ray_cast_3d_33, ray_cast_3d_34, 
ray_cast_3d_35, ray_cast_3d_36, ray_cast_3d_37, ray_cast_3d_38, ray_cast_3d_39, 
ray_cast_3d_40, ray_cast_3d_41, ray_cast_3d_42, ray_cast_3d_43, ray_cast_3d_44, 
ray_cast_3d_45, ray_cast_3d_46, ray_cast_3d_47, ray_cast_3d_48]

var scantime:float = 0.0
var max_scantime:float = 0.5
var looking:bool = true
var target:Vector3 = Vector3.ZERO


func _process(delta: float) -> void:
	if scantime < 0.0:
		for scanning in rays:
			if scanning.is_colliding():
				if scanning.get_collider().is_in_group("player") and looking:
					randomize()
					var choise:int = randi_range(1, 2)
					if choise == 1:
						audio1.play()
					else:
						audio2.play()
					target = scanning.get_collider().global_position
					look_at(target)
					var direction:Vector3 = (scanning.get_collider().global_position - global_position)
					velocity = transform.basis * (direction.normalized() * speed)
					looking = false
		if global_position.x > 5000 or global_position.x < -5000:
			queue_free()
		if global_position.z > 5000 or global_position.z < -5000:
			queue_free()
		scantime = max_scantime
	else:
		scantime -= delta
	move_and_slide()
