extends Node
var animator = 0  # still works

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator = get_parent().get_node("AnimationPlayer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	Globals.changeScene(Globals.level1)
	Globals.shouldMusicBePlaying = true
	pass # Replace with function body.


func _on_how_pressed() -> void:
	Globals.changeScene(Globals.newHowScene)


func _on_play_mouse_entered() -> void:
	animator.play("buttons")
	pass # Replace with function body.

func _on_play_mouse_exited() -> void:
	animator.play_backwards("buttons")
	pass # Replace with function body.



func _on_how_mouse_entered() -> void:
	animator.play("howon")
	pass # Replace with function body.


func _on_how_mouse_exited() -> void:
	animator.play_backwards("howon")
	pass # Replace with function body.


func _on_main_pressed() -> void:
	Globals.changeScene(Globals.titleScene)
	pass # Replace with function body.
