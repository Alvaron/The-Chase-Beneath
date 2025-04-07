extends Node3D

@onready var menu_display: VBoxContainer = $MarginContainer/VBoxContainer
@onready var credits_display: VBoxContainer = $MarginContainer/VBoxContainer2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	menu_display.visible = true
	credits_display.visible = false
	OverheadScript.set_main_node(get_parent())

func _on_play_pressed() -> void:
	OverheadScript.main_node.get_child(0).queue_free()
	var screen_between = OverheadScript.loading_screen.instantiate()
	OverheadScript.main_node.add_child(screen_between)
	screen_between.load_to_level("res://Scenes/test.tscn")
	#get_tree().change_scene_to_file("res://Scenes/test.tscn")

func _on_credits_pressed() -> void:
	menu_display.visible = false
	credits_display.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	menu_display.visible = true
	credits_display.visible = false
