extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


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
		$AnimatedSprite2D.flip_h = false
	elif direction < 0 :
		$AnimatedSprite2D.flip_h = true


	# Handle Animation
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("idle")
			
		else : 
			$AnimatedSprite2D.play("run")
		
	else:
		$AnimatedSprite2D.play("jump")
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
