extends Control

func _on_exit_pressed():
	GameManager.exitGame()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
