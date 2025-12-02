extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var isDead = OldGlobals.isDead
	if OldGlobals.isDead :
				show()
				if Input.is_action_just_pressed("click"):
					OldGlobals.isDead = false
					print("returning to title screen")
					Globals.changeScene(Globals.titleScene)
