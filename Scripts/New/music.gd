extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = load("res://Sounds/Main theme.mp3")
	stream.loop = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.shouldMusicBePlaying and !Globals.isMusicPlaying:
		play()
		print("starting music")
		Globals.isMusicPlaying = true
	elif !Globals.shouldMusicBePlaying and Globals.isMusicPlaying:
		stop()
		print("aw no more cool music ):")
		Globals.isMusicPlaying = false
