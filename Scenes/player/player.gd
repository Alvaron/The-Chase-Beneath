extends CharacterBody3D

var speed:float = 5
var jump_speed:float = 4.5
var can_jump:bool = true
var gravity:float = 0.0
var mouse_sensitivity:float = 700
var input:Vector3
var input_mouse:Vector2

var movement_velocity:Vector3
var rotation_target:Vector3

var equiped = []

@onready var camera: Camera3D = $Camera3D
@onready var ray: RayCast3D = $Camera3D/RayCast3D
@onready var label: Label = $Camera3D/Label
@onready var audio_footsteps: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	rotation_target.y = rotation.y

func _physics_process(delta: float) -> void:
	handle_controls(delta)
	handle_gravity(delta)
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	velocity = transform.basis * (input.normalized() * speed)
	velocity.y += -gravity
	move_and_slide()
	
	camera.rotation.x = lerp_angle(camera.rotation.x, rotation_target.x, delta * 25)
	rotation.y = lerp_angle(rotation.y, rotation_target.y, delta * 25)
	check_interaction()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		input_mouse = event.relative / mouse_sensitivity
		rotation_target.y -= event.relative.x / mouse_sensitivity
		rotation_target.x -= event.relative.y / mouse_sensitivity

func handle_controls(delta:float) -> void:
	input.x = Input.get_axis("left", "right")
	input.z = Input.get_axis("forward", "backward")
	
	if input.z != 0 and is_on_floor():
		if !audio_footsteps.playing:
			randomize()
			audio_footsteps.pitch_scale = randf_range(0.95, 1.05)
			audio_footsteps.play()
			print(audio_footsteps.pitch_scale)
	else:
		audio_footsteps.stop()
	
	var rotation_input:Vector3 = Vector3.ZERO
	rotation_target -= rotation_input.limit_length(1.0) * 5
	rotation_target.x = clamp(rotation_target.x, deg_to_rad(-90), deg_to_rad(90))
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			gravity = -jump_speed
	
	if Input.is_action_just_pressed("interact"):
		if ray.is_colliding() and ray.get_collider().is_in_group("interactable"):
			if !ray.get_collider().get_parent().locked:
				ray.get_collider().get_parent().interact()
			else:
				if equiped.has(ray.get_collider().get_parent().locked_required):
					ray.get_collider().get_parent().interact()
	
	if Input.is_action_pressed("debug_escape"):
		get_tree().quit()

func handle_gravity(delta:float) -> void:
	if gravity < 9.5:
		gravity += 9.5 * delta

func check_interaction() -> void:
	if ray.is_colliding():
		if ray.get_collider().is_in_group("interactable") and ray.get_collider().get_parent().is_useable():
			label.text = "USE  [ F ]"
			label.visible = true
			if ray.get_collider().get_parent().locked and !equiped.has(ray.get_collider().get_parent().locked_required):
				label.text = "YOU NEED " + ray.get_collider().get_parent().locked_required
	else:
		label.visible = false
