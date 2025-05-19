extends Control

@export_multiline var confirmation_text: String = "Default text"
@onready var label = $CenterContainer/Panel/VBoxContainer/Label
signal confirm

func _ready():
	label.text = confirmation_text

func _on_cancel_pressed():
	$".".visible = false


func _on_confirm_pressed():
	emit_signal("confirm")
