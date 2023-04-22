extends Node2D


# the closer the mouse is to the player, the less far that the hook is shot


var velocity = Vector2(0,1)
var gravity = 3
var hook_speed = 500
var hook_position := Vector2(0,0)
var direction := Vector2(0,0)
var player_position = Vector2(0,0)
var collisoin_data;

var is_shot = false

var movement_speed = 3




# Called when the node enters the scene tree for the first time.
func _ready():
	var thing = 10;
	pass # Replace with function body.

func _process(delta):
	
	# draw the chains and hook
	if is_shot:

		var hook_position = $Tip.position
		var start_point = to_local(player_position)
		
		$Links.position = (start_point + hook_position) / 2
		$Links.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		$Tip.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
	
		$Links.region_rect.size.y = start_point.distance_to(hook_position) * 2.4
	
	
func _physics_process(delta):
	
	if $Tip != null:
		velocity += Vector2(0, gravity)
		collisoin_data = $Tip.move_and_collide(velocity.normalized() * delta * hook_speed)
	
	# in the unique case that we hooked something and it is metal
	if collisoin_data != null and collisoin_data.get_collider() is StaticBody2D:
			print(collisoin_data.get_collider())
			velocity = velocity.bounce(collisoin_data.normal)
			velocity.x *= 0.9
			velocity.y *= 0.9
	# or if we catch something more generically
	elif collisoin_data != null:
		
		# stop the hook from moveing
		hook_speed = 0;
		gravity = 0;
		get_tree().get_root().get_node("Main/Player").is_hooked = true;
		
		print(collisoin_data);

		return
	
