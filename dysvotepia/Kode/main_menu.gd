extends Control

func _ready():
	#konek signal button
	$NewGameButton.pressed.connect(_on_new_game_pressed)
	$SettingsButton.pressed.connect(_on_settings_pressed)
	$ExitButton.pressed.connect(_on_exit_pressed)
	
func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scene/physical.tscn")
	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scene/voting.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
