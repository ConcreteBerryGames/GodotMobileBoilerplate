extends Control

@onready var grid = $CenterContainer/LevelsGrid

func _ready():
	generate_level_buttons()

func generate_level_buttons():
	print("generate_level_buttons")
	for child in grid.get_children():
		child.queue_free()
	for i in range(1, GameManager.max_level + 1):
		var btn = Button.new()
		btn.text = str(i)
		btn.name = "Level_" + str(i)
		btn.disabled = i > GameManager.current_level
		# Connect the button's "pressed" signal to a shared function, passing the level number as an argument
		btn.connect("pressed", Callable(self, "_on_level_pressed").bind(i))
		grid.add_child(btn)

func _on_level_pressed(level_number):
	GameManager.loadLevel(level_number)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
