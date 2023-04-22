# thing one thing two
extends KinematicBody2D

# constants
const player_start_position := Vector2(-606, 306);
const verticle_propulsion = 1000
const movement_speed = 350
const chain_movement_speed = 100
const gravity = 60
const max_movement_speed = 1900
const friction_air = 0.95
const friction_ground = 0.85
const grapple_hook = preload("res://Chain.tscn")
const particles = preload("res://Particles2D.tscn")
var last_hook = null
var last_smoke = null
var player_click = Vector2(0,0)

# mutable data members
export var velocity = Vector2(0,0)
export var chain_velocity = Vector2(0,0)
var can_jump = false
var cool_down = 0
var is_hooked = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("BackgroundMusic/AudioStreamPlayer").play()
	pass # Replace with function body.
	
	
func _process(delta):
	if cool_down > 0:
		cool_down -= 1
	if last_hook != null:
		last_hook.player_position = $Node2D/Position2D.global_position
	
	if (last_hook != null and not Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		last_hook.queue_free()
		last_hook = null
		
		
		
func _physics_process(delta):
	
	# replay music 
	if get_parent().get_node("BackgroundMusic/AudioStreamPlayer").playing == false:
		get_parent().get_node("BackgroundMusic/AudioStreamPlayer").play()
		
	# make player restart the game if they fall off of the map
	if self.position.y >= 1500:
		self.position = player_start_position
	
	# Literally shooting the grapple hook
	$Node2D.look_at(get_global_mouse_position())
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) or Input.is_action_pressed("shoot")) and cool_down == 0 and (self.is_on_floor() or self.is_on_wall()):
		shoot(player_click)
		cool_down = 100
		pass
	
	# Aiming the Grapple cannon
	# whether or not to draw the hook
	if (Input.is_mouse_button_pressed(BUTTON_RIGHT) or Input.is_action_pressed("aim")):
		$Sprite.show()
	else:
		$Sprite.hide()
	# if the canon has been drawn, it needs to point the mouse
	$Sprite.look_at(get_global_mouse_position())
	
	# this is sort of like dead code
	# it flips the sprite of the canon if e rotate a certain amount, so that the cannon is not upside down
	# well, it turns out the cannon is mirrored on the horizontal axis, so it does not matter 
	# I just want this here so that, if I change the sprite, it still works
	if (get_global_mouse_position().x < position.x):
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
	
	# PLAYER MOVEMENT
	
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
	
	# PLAYER MOVEMENT --> HOOK PHYSICS
	if is_hooked and last_hook != null and Input.is_action_pressed("rappel_up"):
		
		var pull_direction = to_local(last_hook.get_node("Tip").global_position).normalized()
		#print(pull_direction)
		chain_velocity = pull_direction * chain_movement_speed
		
		if chain_velocity.y > 0 :
			#print(0.5)
			chain_velocity.y *= 0.50
		else:
			#print(1.2)
			chain_velocity.y *= 1.2
		
		if sign(chain_velocity.x) != sign(walk):
			chain_velocity.y *= 0.7
		
		pass
	else:
		chain_velocity = Vector2(0,0)
	
	velocity += chain_velocity
	

	# Manage friction and refresh jump and stuff
	velocity.y = clamp(velocity.y, -max_movement_speed, max_movement_speed)	# Make sure we are in our limits
	velocity.x = clamp(velocity.x, -max_movement_speed, max_movement_speed)
	
	velocity.x += walk		# apply the walking
	move_and_slide(velocity, Vector2.UP)	# apply gravity and horizontal displacement
	velocity.x -= walk		# stops us from doubleing movement speed

	# Manage friction and refresh jump and stuff
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


func shoot(pos):
	
	# delete previous hooks 
	if (last_hook != null):
		last_hook.queue_free()
		last_hook = null
		last_smoke.queue_free()
		last_smoke = null
	
	# instance another hook object
	var hook = grapple_hook.instance() 
	var smoke = particles.instance()
	last_hook = hook;
	last_smoke = smoke;
	
	
	# update some hook variables
	hook.direction = pos
	hook.player_position = $Node2D/Position2D.global_position # has to be the global position
	hook.is_shot = true;
	is_hooked = false;
	
	# add the hook object that we made to the scene tree
	
	get_parent().add_child(hook)
	hook.position = $Node2D/Position2D.global_position
	get_parent().add_child(smoke)
	smoke.position = $Node2D/Position2D.global_position
	
	#direction
	hook.velocity = get_global_mouse_position() - hook.position
	
	# Sound and Camera Effects
	$Node2D/GunShot.play()
	

	
func _input(event: InputEvent):
	
	# checks for input every frame, and if we are aiming and shooting, then we set the position variable 
	if event is InputEventMouseButton and (Input.is_mouse_button_pressed(BUTTON_LEFT) or Input.is_action_pressed("shoot")) and (Input.is_mouse_button_pressed(BUTTON_RIGHT) or Input.is_action_pressed("aim")):
		player_click = event.position
	
# shoot hook method 
	# 1: make a hook object that moves in a direction
	# 2: instance the mode 
	# 3: set its position 
	# 4: make it look at the mouse
	# 5: 
	
