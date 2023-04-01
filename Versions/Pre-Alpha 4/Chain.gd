extends Node2D


# the closer the mouse is to the player, the less far that the hook is shot


var velocity = Vector2(0,1)
var gravity = 2
var hook_speed = 300
var hook_position := Vector2(0,0)
var direction := Vector2(0,0)
var player_position = Vector2(0,0)

var is_flying = false

var movement_speed = 3




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	# draw the chains and hook
	if is_flying:

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
	
	#$Tip.global_position = hook_position
	#if is_flying and $Tip.move_and_collide(velocity * hook_speed):
	#	is_hooked = true
	#	is_flying = false
	#hook_position = $Tip.global_position
		



#$Links.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		#$Tip/Hook.rotation = $Links.position.angle_to_point(hook_position) - deg2rad(90)
		#$Tip/Hook.rotation_degrees
		#$Tip/Hook.rotation_degrees = direction
		
		
		#$Tip/Hook.look_at(direction)
		#print(direction)
		#$Links.look_at(direction)
		#$Links.rotation_degrees -= 90 
		
		#$Links.rotation = self.position.angle_to_point(velocity) - deg2rad(0)
		#$Tip.rotation = self.position.angle_to_point(direction) - deg2rad(90)
		#print("At click: ",direction)
	
		#$Links.position = hook_position
	
		
		#print(player_position.normalized(),velocity.normalized() )
		#$Links.region_rect.size.y = velocity.length() - player_position.length()
