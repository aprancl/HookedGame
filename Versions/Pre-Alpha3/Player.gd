extends KinematicBody2D

# constants
const verticle_propulsion = 1000
const movement_speed = 350
const gravity = 60
const max_movement_speed = 1900
const friction_air = 0.95
const friction_ground = 0.85
const chain_pull = 100
const hook_path = preload("res://Bullet.tscn") # for old hook
#const hook_path = preload("res://Chain.tscn")

# mutable data members
export var velocity = Vector2(0,0)
export var chain_velocity = Vector2(0,0)
var can_jump = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func _physics_process(delta):
	
	$Node2D.look_at(get_global_mouse_position())
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		shoot()
	
	if not Input.is_mouse_button_pressed(BUTTON_RIGHT):
		$Sprite.hide()
	else:
		$Sprite.show()
	$Sprite.look_at(get_global_mouse_position())
	if (get_global_mouse_position().x < position.x):
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
	
	# add gravity
	velocity.y += gravity
	
	
	# Horizontal movement of player
	var walk = (Input.get_action_strength("right") - Input.get_action_strength("left")) * movement_speed
	
	#play right animations
	if Input.is_action_pressed("left"):
		$AnimatedSprite.animation = "run";
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right"):
		$AnimatedSprite.animation = "run";
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "idle";
	
	# hook physicis stuff potentially here

	# Manage friction and refresh jump and stuff
	velocity.y = clamp(velocity.y, -max_movement_speed, max_movement_speed)	# Make sure we are in our limits
	velocity.x = clamp(velocity.x, -max_movement_speed, max_movement_speed)
	
	velocity.x += walk		# apply the walking
	move_and_slide(velocity, Vector2.UP)	# apply gravity and horizontal displacement
	velocity.x -= walk		# stops us from doubleing movement speed

	# Manage friction and refresh jump and stuff
	# TODO can delete ?
	#velocity.y = clamp(velocity.y, -max_movement_speed, max_movement_speed)	# Make sure we are in our limits
	#velocity.x = clamp(velocity.x, -max_movement_speed, max_movement_speed)
	
	# apply ground friction
	if is_on_floor():
		velocity.x *= friction_ground	# Apply friction only on x (we are not moving on y anyway)
		can_jump = true 				# We refresh our air-jump
		if velocity.y >= 5:		# Keep the y-velocity small such that
			velocity.y = 5		# gravity doesn't make this number huge

	# Apply air friction
	if  not is_on_floor():
		velocity.x *= friction_air
		if velocity.y > 0:
			velocity.y *= friction_air

	# Jumping
	if Input.is_action_just_pressed("space"):
		if is_on_floor():
			velocity.y = -verticle_propulsion	# Apply the jump-force


func shoot():
	var hook = hook_path.instance() 
	
	get_parent().add_child(hook)
	hook.position = $Node2D/Position2D.global_position
	
	hook.velocity = get_global_mouse_position() - hook.position

	
	
	
# shoot hook method 
	# 1: make a hook object that moves in a direction
	# 2: instance the mode 
	# 3: set its position 
	# 4: make it look at the mouse
	# 5: 
	