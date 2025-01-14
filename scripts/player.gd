extends CharacterBody2D
class_name PlayerController

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animate_player = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D.play() 
		
	

	# Handle movement.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0 :
		animate_player.flip_h = false
	elif direction < 0 :
		animate_player.flip_h = true


	# Handle Animation
	if is_on_floor():
		if direction == 0:
			animate_player.play("idle")
			
		else : 
			animate_player.play("run")
		
	else:
		animate_player.play("jump")
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
