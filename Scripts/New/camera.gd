extends Camera2D
var playerPos : Vector2 = Vector2(0, 0)
var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("player")
	position_smoothing_enabled = true
	position_smoothing_speed = 200.0 

	playerPos = get_parent().get_node("player").global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	playerPos = get_parent().get_node("player").global_position
	#position = position.lerp(player.global_position, 0.1)
	#position = position.snapped(Vector2(1, 1))
	global_position = global_position.move_toward(player.global_position, position_smoothing_speed * (global_position.distance_to(player.global_position) / 100) * delta)
	print(global_position.distance_to(player.global_position))


#extends Camera2D
#
#@export var smoothing_speed := 8.0 # units per second, tune low->slower, high->snappier
#var player : Node2D
#
#func _ready() -> void:
	#player = get_parent().get_node("player")
	#is_current()
	#
#func _process(delta: float) -> void:
	#if not player:
		#return
	## move_toward is stable and delta-correct
	#global_position = global_position.move_toward(player.global_position, smoothing_speed * delta)
