extends Node2D
var titleScene        = load("res://Scenes/title.tscn")
var oldGameTitleScene = load("res://old/scenes/tastlevel.tscn")
var newTitleScreen    = load("res://Scenes/New/new_title.tscn")
var level1            = load("res://Scenes/New/Level1.tscn")
var level2            = load("res://Scenes/New/Level2.tscn")
var newHowScene       = load("res://Scenes/New/how.tscn")
var lastLevel         = load("res://Scenes/New/lastLevel.tscn")
var pauseScene        = load("res://Scenes/New/pause_menu.tscn")
var currentScene = titleScene
var isPlayerBehindMysteryBox = false
var shouldNextLevelAnimationBeShowing = false
var shouldMusicBePlaying = false
var isMusicPlaying = false
var playPauseSound = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_pressed("pause"):
		toggle_pause()
	
	
	if Input.is_action_pressed("restart"):
		respawn()
	pass
func changeScene(scene):
	get_tree().change_scene_to_packed(scene)
	currentScene = scene

func respawn():
	get_tree().reload_current_scene()

func nextLevel():
	isPlayerBehindMysteryBox = false
	if currentScene == level1:
		changeScene(level2)
	elif currentScene == level2:
		changeScene(lastLevel)
	elif currentScene == lastLevel:
		shouldMusicBePlaying = false
		changeScene(newTitleScreen)
	
func toggle_pause():
	#get_tree().paused = !get_tree().paused
	#print("toggleing paused")
	#playPauseSound = true
	pass
