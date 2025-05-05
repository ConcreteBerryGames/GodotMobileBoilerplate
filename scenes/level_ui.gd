extends Control


func _on_back_pressed():
	$CanvasLayer/LeavingLevelConfimation.popup_centered()


func _on_leaving_level_confimation_confirmed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
