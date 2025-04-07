extends Node

@onready var loading_screen = preload("res://Scenes/levels/loadscreen.tscn")
var main_node:Node3D

var tasks:Dictionary = {
	"level2_steamhazard" = true
} 

func set_main_node(my_node:Node3D) -> void:
	main_node = my_node
