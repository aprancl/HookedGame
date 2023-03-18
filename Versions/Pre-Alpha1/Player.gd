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
	
	# apply gravity
	position += Vector2(0,gravity)
	
	# the different in posiiton it set to nothing at first
	var velocity = Vector2.ZERO # the player's movement vector 
	
	# adjusting the player's movement based on user input
	#print(is_on_floor())
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y -= jump_distance
	
	# jumping
	if Input.is_action_just_pressed("jump") and Input.is_action_pressed("left") and is_on_floor():
		velocity.y -= jump_distance
		velocity.x -= speed * 10 # move player slightly to left when jumo left
		$AnimationPlayer.play("walk") # have a jump animation
	elif Input.is_action_just_pressed("jump") and Input.is_action_pressed("right") and is_on_floor():
		velocity.y -= jump_distance
		velocity.x += speed *10 # move player slightly to right when jumo right
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_distance
		velocity.x -= speed / 2
		velocity.y - jump_distance
		#velocity = position.direction_to(Vector2(position.x, velocity.y - 1)) * (speed / 4)
		#move_and_slide(velocity * 40)
		
		pass
		
	# Horizontal
	if Input.is_action_pressed("right"):
		velocity.x += speed
		$Sprite.flip_h = false
		$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x -= speed
		$Sprite.flip_h = true
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.stop()
		

	# Actually move the character
	# vector 2 UP defines the gorund. else eveything is a wall by default
	move_and_slide(velocity, Vector2.UP) 
	
	
	
	# OLD CODE FRAGMENTS - maybe useful
	#move_and_collide(velocity * delta) # collides but doesnt move
	#position += velocity # moves but doesnt colides
	
	
	
	



