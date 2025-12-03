extends Node2D
var titleScene        = load("res://Scenes/title.tscn")
var oldGameTitleScene = load("res://old/scenes/tastlevel.tscn")
var newTitleScreen    = load("res://Scenes/New/new_title.tscn")
var level1            = load("res://Scenes/New/Level1.tscn")
var isPlayerBehindMysteryBox = false
var shouldNextLevelAnimationBeShowing = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeScene(scene):
	get_tree().change_scene_to_packed(scene)

func respawn():
	get_tree().reload_current_scene()

func nextLevel():
	print("if you made anouther level we could progress but you're just TOO LAZY to do that, huh?")
	isPlayerBehindMysteryBox = false
	respawn()
