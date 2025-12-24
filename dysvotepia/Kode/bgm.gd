extends Node

func _ready():
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()

func play():
	if not $AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()
		
func stop():
	$AudioStreamPlayer.stop()
	
func set_volume(_value: float):
	# 0 : normal, -10 : lebih pelan
	$AudioStreamPlayer.volume_db = 0
	
func change_music(new_stream: AudioStream):
	$AudioStreamPlayer.stream = new_stream
	$AudioStreamPlayer.play()
