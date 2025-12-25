extends Control

@onready var logo = $TextureRect
@onready var text = $Label

func _ready() -> void:
	BGM.stop()
	logo.modulate.a = 0
	text.modulate.a = 0
	
	var tween = create_tween()
	#logo fade in
	tween.tween_property(logo, "modulate:a", 1.0, 0.8)
	tween.tween_interval(0.7)
	
	#text fade in
	tween.tween_property(text, "modulate:a", 1.0, 0.6)
	tween.tween_interval(1.0)
	
	#fade out barengan
	tween.tween_property(logo, "modulate:a", 0.0, 0.8)
	tween.parallel().tween_property(text, "modulate:a", 0.0, 0.8)
	
	tween.tween_callback(_go_next)
	
func _go_next():
	get_tree().change_scene_to_file("res://Scene/StartMenutscn.tscn")
