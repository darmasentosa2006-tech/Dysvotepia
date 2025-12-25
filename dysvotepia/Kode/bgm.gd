extends Node

@onready var player = $AudioStreamPlayer

func _ready():
	pass

func play():
	if not player.playing:
		player.play()
		
func stop():
	player.stop()
	
func set_volume(_value: float):
	# 0 : normal, -10 : lebih pelan
	$AudioStreamPlayer.volume_db = 0
	
func change_music(new_stream: AudioStream):
	$AudioStreamPlayer.stream = new_stream
	$AudioStreamPlayer.play()
