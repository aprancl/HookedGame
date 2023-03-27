extends Node2D

var velocity = Vector2(0,1)
var gravity = 2
var hook_speed = 300
var hook_position := Vector2(0,0)
var direction = Vector2(0,0)

var is_hooked = true
var is_flying = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	
	
	# the reason that the chain is no showing is because of the hook_position.lenght() is 0
	if is_hooked or is_flying:
		
		var player_click = get_global_mouse_position()
		#$Links.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		#$Tip/Hook.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		#$Tip/Hook.rotation_degrees
		#$Tip/Hook.rotation_degrees = direction
		$Tip/Hook.look_at(direction)
		$Links.look_at(get_global_mouse_position())
		$Links.rotation_degrees -= 90 
		print(direction)
	
	
		$Links.position = hook_position
		$Links.region_rect.size.y = direction.length()
		pass
	
	
	pass
	
func _physics_process(delta):
	
	
	velocity += Vector2(0, gravity)
	$Tip.move_and_collide(velocity.normalized() * delta * hook_speed)
	
	#$Tip.global_position = hook_position
	#if is_flying and $Tip.move_and_collide(velocity * hook_speed):
	#	is_hooked = true
	#	is_flying = false
	#hook_position = $Tip.global_position
		
