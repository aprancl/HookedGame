extends Node2D


# the closer the mouse is to the player, the less far that the hook is shot


var velocity = Vector2(0,1)
var gravity = 2
var hook_speed = 300
var hook_position := Vector2(0,0)
var direction := Vector2(0,0)
var player_position = Vector2(0,0)

var is_shot = false

var movement_speed = 3




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	# draw the chains and hook
	if is_shot:

		var hook_position = $Tip.position
		var start_point = to_local(player_position)
		
		$Links.position = (start_point + hook_position) / 2
		$Links.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		$Tip.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
	
		$Links.region_rect.size.y = start_point.distance_to(hook_position) * 2.5
	
	
func _physics_process(delta):
	
	
	velocity += Vector2(0, gravity)
	var collisoin_data = $Tip.move_and_collide(velocity.normalized() * delta * hook_speed)
	

	if collisoin_data != null:
		hook_speed = 0;
		gravity = 0;
		get_tree().get_root().get_node("Main/Player").is_hooked = true;

		return
	
