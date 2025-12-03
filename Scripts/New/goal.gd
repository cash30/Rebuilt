extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.isPlayerBehindMysteryBox = true
		$Timer.start()
		$Area2D/QuestionMarkBeforeWin.hide()
		#print($Timer)

func _on_timer_timeout() -> void:
	Globals.nextLevel()
	$Area2D/QuestionMarkBeforeWin.show()
	pass # Replace with function body.
