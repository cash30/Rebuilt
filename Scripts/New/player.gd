
extends CharacterBody2D
class_name PlayerController

const speed = 200.0
const jumpPower = -300.0
var circ = 301.5929
var rad = 45   
@export var direction = 0
@export var zoom = 3

var last_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	circ = 2 * rad * PI
	last_position = global_position
	rad = $Marker2D.global_position.distance_to($Marker2D2.global_position)

func _physics_process(delta: float) -> void:
	if Globals.isPlayerBehindMysteryBox:
		$Camera2D.position_smoothing_enabled = true
		position = get_parent().get_node("Goal").global_position 
		hide()
	else:
		show()
		$Camera2D.position_smoothing_enabled = false
		
	if position.y > 250:
		Globals.respawn()
	
	if not is_on_floor() and !Globals.isPlayerBehindMysteryBox:
		velocity += get_gravity() * delta

	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y = jumpPower
		
		
	if Input.is_action_pressed("right") and !Globals.isPlayerBehindMysteryBox:
		direction = 1
		velocity.x = speed
		
	elif Input.is_action_pressed("left") and !Globals.isPlayerBehindMysteryBox:
		direction = -1
		velocity.x = -speed
		
	else:
		direction = 0
		velocity.x = 0

	move_and_slide()

	apply_rolling_rotation(delta)

func apply_rolling_rotation(delta: float) -> void:
	var movement := global_position - last_position
	var distance := movement.length()

	if distance > 0.0:
		if velocity.x > 0:
			var angle = (-distance / circ) * 360.0
			rotation_degrees -= angle
		elif velocity.x < 0:
			var angle = (distance / circ) * 360.0
			rotation_degrees -= angle
	last_position = global_position
