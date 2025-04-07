extends Node3D

var target_scene_path:String
var loading_status:int
var progress: Array[float]
@onready var progress_bar: ProgressBar = $ProgressBar

func load_to_level(targetlevel:String) -> void:
	target_scene_path = targetlevel
	ResourceLoader.load_threaded_request(target_scene_path)

func _process(delta: float) -> void:
	loading_status = ResourceLoader.load_threaded_get_status(target_scene_path, progress)
	match loading_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress_bar.value = progress[0] * 100
		ResourceLoader.THREAD_LOAD_LOADED:
			var loaded_scene = ResourceLoader.load_threaded_get(target_scene_path)
			OverheadScript.main_node.add_child(loaded_scene.instantiate())
			call_deferred("queue_free")
