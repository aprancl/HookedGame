extends KinematicBody2D


#const UP = Vector2(0, -1)
#const GRAVITY = 20
#const MAXFALLSPEED = 200
#const MAXSPEED = 80
#var motion = Vector2()
export var speed = 400 # speed in pixels per second
var screen_size # game window size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func _physics_process(delta):
	
	var velocity = Vector2.ZERO # the player's movement vector 
	print(velocity)
	
	# adjusting the player's movement based on user input
	if Input.is_action_pressed("right"):
		velocity.x += 1
		print(velocity.x)
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		print(velocity.x)
	
	
	position += velocity
	
	
	



