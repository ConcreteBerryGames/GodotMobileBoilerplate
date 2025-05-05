extends Node

var current_level = 1
var unlocked_level = 1
var max_level = 3
var save_file = "user://save_data.cfg"

func _ready():
	load_progress()

func load_progress():
	var config = ConfigFile.new()
	var err = config.load(save_file)
	if err == OK:
		current_level = config.get_value("progress", "unlocked_level", 1)
	else:
		current_level = 1

func save_progress():
	var config = ConfigFile.new()
	config.set_value("progress", "unlocked_level", unlocked_level)
	config.save(save_file)

func go_to_next_level():
	if current_level == unlocked_level:
		unlocked_level += 1
		save_progress()
	if current_level < max_level:
		current_level += 1
		loadLevel(current_level)
	else:
		get_tree().change_scene_to_file("res://scenes/end.tscn")
		
func reset_progress():
	unlocked_level = 1
	current_level = 1
	save_progress()
	
func loadLevel(level_number):
	current_level = level_number
	var scene_path = "res://scenes/level_%d.tscn" % level_number
	get_tree().change_scene_to_file(scene_path)
	
func exitGame():
	get_tree().quit()
