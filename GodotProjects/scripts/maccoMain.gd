extends CharacterBody2D

var speed = 350
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
enum {X_LOCK = -1, Y_LOCK = 1}
var state


func comma_touching(surface):
	if surface == "floor":
		return get_parent().get_node("Comma").is_on_floor()
	if surface == "ceiling":
		return get_parent().get_node("Comma").is_on_ceiling()
	if surface == "wall":
		return get_parent().get_node("Comma").is_on_wall()
	else: return null

# Called when the node enters the scene tree for the first time.
func _ready():
	state = Y_LOCK
	get_parent().get_node("CanvasLayer/Control/XYLOCKs/XLOCK").visible = false
	up_direction = Vector2(0,1)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_on_floor():
		velocity.y += -gravity
	
	if state == X_LOCK:
		if !comma_touching("wall"):
			if Input.is_action_pressed("ui_right"):
				velocity.x = speed
				$AnimatedSprite2D.flip_h = false
			elif Input.is_action_pressed("ui_left"):
				velocity.x = -speed
				$AnimatedSprite2D.flip_h = true
			else:
				velocity.x = 0
		else:
			velocity.x = 0
	else:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			$AnimatedSprite2D.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			$AnimatedSprite2D.flip_h = true
		else:
			velocity.x = 0
		if comma_touching("floor") or comma_touching("ceiling"):
			velocity.y = 0
			
	if Input.is_action_pressed("ui_up") and comma_touching("floor"):
			velocity.y = speed*4
	
	
	if Input.is_action_just_pressed("ui_down"):
		state *= -1
		if state == Y_LOCK:
			get_parent().get_node("CanvasLayer/Control/XYLOCKs/XLOCK").visible = false
		else:
			get_parent().get_node("CanvasLayer/Control/XYLOCKs/XLOCK").visible = true
		
	
	
	move_and_slide()
