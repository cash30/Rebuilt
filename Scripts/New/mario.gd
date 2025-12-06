extends CharacterBody2D

@export var speed: float = 150.0
@export var detection_range: float = 1000.0
@export var jumpVelocity = -300.0
var myScale = 1
var isFlipped = false
var feelsLikeJumping = false

var player: Node2D
var direction: Vector2 = Vector2.ZERO

func _ready():
	myScale = scale
	# Assumes the player is in the same scene and named "Player"
	player = get_tree().get_first_node_in_group("player")  # Better if you use groups

func _physics_process(delta):
	#If up against a wall, jump
	if abs(direction.x) > 0 and velocity.x == 0 and !is_on_floor():
		feelsLikeJumping = true	
	if direction.x > 0 and isFlipped:
		scale.x = -myScale.x
		isFlipped = false
	elif direction.x < 0 and !isFlipped:
		scale.x = -myScale.x
		isFlipped = true
		
	
	if not player:
		print("Can't find player. ending enimie movement process")
		return

	var distance_to_player = global_position.distance_to(player.global_position)

	if distance_to_player <= detection_range:
		direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		#print("going to player")
		#print("Direction:", direction.x, "Velocity X:", velocity.x)

	else:
		velocity.x = 0 
		pass
		
	if is_on_floor() and feelsLikeJumping:
		jump()
		
		
	if not is_on_floor():
		velocity += get_gravity() * delta  
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.respawn()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var num = randi_range(0, 2)
	if num == 0:
		feelsLikeJumping = true
	else:
		feelsLikeJumping = false
	$Timer.start(0.5)

func jump():
	velocity.y = jumpVelocity #* -direction.y
	feelsLikeJumping = false
	
	
	


	pass # Replace with function body.
