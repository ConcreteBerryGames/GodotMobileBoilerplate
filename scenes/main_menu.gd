extends Control

@onready var reset_button = $CenterContainer/VBoxContainer/Reset

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_link_pressed():
	OS.shell_open("https://concreteberry.itch.io/")


func _on_reset_pressed():
	$ResetConfirmation.visible = true

func _on_exit_pressed():
	$ExitConfirmation.visible = true

func _ready():
	print(GameManager.current_level)
	reset_button.disabled = GameManager.current_level == 1


func _on_settings_toggled(toggled_on):
	if toggled_on:
		TranslationServer.set_locale("pl")
	else:
		TranslationServer.set_locale("en")
		


func _on_exit_confirmation_confirm():
	GameManager.exitGame()


func _on_reset_confirmation_confirm():
	GameManager.reset_progress()
	reset_button.disabled = true
	$ResetConfirmation.visible = false
