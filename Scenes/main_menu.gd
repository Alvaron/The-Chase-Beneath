extends Node3D

@onready var menu_display: VBoxContainer = $MarginContainer/VBoxContainer
@onready var credits_display: VBoxContainer = $MarginContainer/VBoxContainer2

func _ready() -> void:
	menu_display.visible = true
	credits_display.visible = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test.tscn")


func _on_credits_pressed() -> void:
	menu_display.visible = false
	credits_display.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	menu_display.visible = true
	credits_display.visible = false
