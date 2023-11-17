extends CharacterBody2D

var speed = 350
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	
	if !is_on_floor():
		velocity.y += gravity
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed*4
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed	
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0
		

	move_and_slide()
