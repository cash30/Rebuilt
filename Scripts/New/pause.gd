extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = load("res://Sounds/pause.mp3")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.playPauseSound:
		play()
		Globals.playPauseSound = false
	pass
