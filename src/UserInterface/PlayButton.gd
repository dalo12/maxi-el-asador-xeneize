extends Button

var next_scene_path: = "res://src/Levels/Level1.tscn"

func _on_button_up():
	get_tree().change_scene(next_scene_path)
