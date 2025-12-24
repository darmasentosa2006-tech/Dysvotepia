extends Control

@onready var vote_scene = preload("res://Scene/vote.tscn")
@onready var marta1 = $MartaText
@onready var marta2 = $MartaText2
var speed := 200.0

#Moving text
func _process(delta):
	marta1.position.x -= speed * delta
	marta2.position.x -= speed * delta
	
	var width = 0.0
	
	if marta1 is Label:
		width = marta1.size.x
		
	if marta1.position.x <= -width: 
		marta1.position.x = marta2.position.x + width + 22
	
	if marta2.position.x <= -width: 
		marta2.position.x = marta1.position.x + width + 22
		
	
func _on_switch_button_pressed():
	get_tree().change_scene_to_file("res://Scene/digital.tscn")
	
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scene/vote.tscn")
