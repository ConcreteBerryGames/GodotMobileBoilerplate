extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_link_pressed():
	OS.shell_open("https://concreteberry.itch.io/")


func _on_reset_pressed():
	$ResetConfirmationDialog.popup_centered()


func _on_reset_confirmation_dialog_confirmed():
	GameManager.reset_progress()


func _on_exit_pressed():
	$ExitConfirmationDialog.popup_centered() 


func _on_exit_confirmation_dialog_confirmed():
	GameManager.exitGame()
