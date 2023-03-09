extends KinematicBody2D


#const UP = Vector2(0, -1)
const GRAVITY = 10
const MAXFALLSPEED = 20
const SPEED = 8
var screen_size # game window size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func _physics_process(delta):
	
	position += Vector2(0,GRAVITY)
	var velocity = Vector2.ZERO # the player's movement vector 
	
	# adjusting the player's movement based on user input
	if Input.is_action_pressed("right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("left"):
		velocity.x -= SPEED
	
	
	move_and_collide(velocity * delta) # collides but doesnt move
	#position += velocity # moves but doesnt colides
	
	
	



