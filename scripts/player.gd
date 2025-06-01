extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:

	var direction2 := Input.get_axis("left", "right")
	if direction2:
		velocity.x = direction2 * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var directiony2 := Input.get_axis("up","down")
	if directiony2:
		velocity.y = directiony2 * SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)

	move_and_slide()
