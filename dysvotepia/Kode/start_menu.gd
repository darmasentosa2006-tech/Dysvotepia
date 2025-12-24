extends Control

func _ready():
	_blink_text()

func _blink_text():
	var tween = create_tween().set_loops() #looping otomatis
	tween.tween_property($PressLabel,"modulate:a", 0.0, 0.8) #fade out
	tween.tween_property($PressLabel,"modulate:a", 1.0, 0.8) #fade in
	
func _unhandled_input(event):
	if event.is_pressed():
		get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
