extends Node2D


func _on_quit_pressed() -> void:
	return get_tree().quit()


func _on_play_pressed() -> void:
	return get_tree().change_scene_to_file("res://Level_1_files/level.tscn")
