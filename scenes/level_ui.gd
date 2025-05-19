extends Control


func _on_back_pressed():
	$CanvasLayer/LeavingLevelConfirmation.visible = true

func _on_leaving_level_confirmation_confirm():
	$CanvasLayer/LeavingLevelConfirmation.visible = false
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
