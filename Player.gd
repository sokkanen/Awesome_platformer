extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250

var velocity = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		velocity.x = 0
		$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_POWER
		
	if !is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")	
		
	velocity.y += GRAVITY

	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	