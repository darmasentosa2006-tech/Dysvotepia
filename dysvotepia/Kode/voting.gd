extends Node

# Variabel Utama
var pilihan_asli:int = 1 #misal checkmark ada di paslon 1
var counter:int = 1
var maks_suara:int = 31

var jujur:int = 0
var manipulasi:int = 0

# Referensi ke UI
@onready var counter_label:Label = $UI/CounterLabel
@onready var jujur_label:Label = $UI/JujurLabel
@onready var manipulasi_label:Label = $UI/ManipulasiLabel
@onready var check1 = $UI/Check1
@onready var check2 = $UI/Check2
@onready var pause_menu = $PauseMenu

func _ready():
	#tampilkan checkmark sesuai pilihan asli
	pause_menu.visible = false
	randomize()
	_set_checkmark()
	
	#pasang event button
	$UI/Paslon1Btn.pressed.connect(_on_paslon_1)
	$UI/Paslon2Btn.pressed.connect(_on_paslon_2)
	
	_update_ui()
	
func _set_checkmark():
	check1.visible = pilihan_asli == 1
	check2.visible = pilihan_asli == 2
	
func _on_paslon_1():
	_proses_vote(1)
	
func _on_paslon_2():
	_proses_vote(2)
	
func _proses_vote(pilihan:int):
	#cek apakah pilihan player sesuai "tercoblos"
	if pilihan == pilihan_asli:
		jujur += 1
	else:
		manipulasi += 1
	
	counter += 1
	_update_ui()
	
	pilihan_asli = randi_range(1, 2)
	_set_checkmark()
	
	#jika sudah 30 > ending
	if counter >= maks_suara:
		genEnding()

func _update_ui():
	counter_label.text = str(counter)
	jujur_label.text = "Suara jujur: " + str(jujur)
	manipulasi_label.text = "Suara dimanipulasi: " + str(manipulasi)
	
	if counter >= 30:
		genEnding()
	
func genEnding():
	var endings = []
	
	if jujur > 15:
		endings = [
			"res://Scene/Ending1.tscn",
			"res://Scene/Ending3.tscn"
		]
	else:
		endings = [
			"res://Scene/Ending2.tscn",
			"res://Scene/Ending4.tscn"
		]
	var chosen = endings.pick_random()
	get_tree().change_scene_to_file(chosen)


func _on_paslon_1_btn_pressed() -> void:
	pass # Replace with function body.


func _on_paslon_2_btn_pressed() -> void:
	pass # Replace with function body.


func _on_pause_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/MainMenu.tscn")
