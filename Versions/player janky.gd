extends KinematicBody2D


#const UP = Vector2(0, -1)
export var gravity := 4
export var max_fall_speed := 50
export var speed := 300
export var jump_distance := 7000
var screen_size # game window size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func _physics_process(delta):
	
	
	
	# the different in posiiton it set to nothing at first
	var velocity = Vector2.ZERO # the player's movement vector 
	
	
	# jumping
	
	if Input.is_action_just_pressed("jump") and Input.is_action_pressed("left") and is_on_floor():
		velocity.y -= jump_distance
		velocity.x -= speed * 10 # move player slightly to left when jumo left
		$AnimatedSprite.flip_h = true
		#$AnimatedSprite.animation = "jump"
		
	
	elif Input.is_action_just_pressed("jump") and Input.is_action_pressed("right") and is_on_floor():
		velocity.y -= jump_distance
		velocity.x += speed *10 # move player slightly to right when jumo right
		$AnimatedSprite.flip_h = false
		#$AnimatedSprite.animation = "jump"
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		
		velocity.y -= jump_distance
		#position.y -= Vector2(0,-100)
		
		#velocity.x -= speed / 2
		#velocity.y - jump_distance
		#$AnimatedSprite.animation = "jump"
		#velocity = position.direction_to(Vector2(position.x, velocity.y - 1)) * (speed / 4)
		#move_and_slide(velocity * 40)
		
	if not is_on_floor():
		$AnimatedSprite.animation = "jump"
		
	# Horizontal
	#if not is_on_floor():
		#$AnimatedSprite.animation = "jump"
	#	print("jump")
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "run"
	elif Input.is_action_pressed("left"):
		velocity.x -= speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "run"
	else:
		$AnimatedSprite.animation = "idle"
		
		
	# apply gravity
	position += Vector2(0,gravity)

	# Actually move the character
	# vector 2 UP defines the gorund. else eveything is a wall by default
	move_and_slide(velocity, Vector2.UP) 
	
	
	
	# OLD CODE FRAGMENTS - maybe useful
	#move_and_collide(velocity * delta) # collides but doesnt move
	#position += velocity # moves but doesnt colides
	
	
	
	



