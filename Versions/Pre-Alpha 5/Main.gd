extends Node2D
var last_door_entered = null;


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# first door pair
	$Door1_start.endpoint_door_reference = $Door1_end
	$Door1_end.endpoint_door_reference = $Door1_start
	
	
	pass # Replace with function body.



func _physics_process(delta):
	
	# manage the animations
	if $Lever_door1.is_active:
		$Door1_start.is_open = true
		$Door1_end.is_open = true
	else:
		$Door1_start.is_open = false
		$Door1_end.is_open = false
		
	print(last_door_entered)
	pass
