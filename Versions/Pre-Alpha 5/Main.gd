extends Node2D
var last_door_entered = null;


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Door 1 pairing
	$Door1_start.endpoint_door_reference = $Door1_end
	$Door1_end.endpoint_door_reference = $Door1_start
	$Door1_end.target_lever_reference = $Lever_door1
	$Door1_start.target_lever_reference = $Lever_door1
	
	# Door 2 pairing
	$Door2_start.endpoint_door_reference = $Door2_end
	$Door2_end.endpoint_door_reference = $Door2_start
	$Door2_start.target_lever_reference = $Lever_door2
	$Door2_end.target_lever_reference = $Lever_door2
	
	
	
	pass # Replace with function body.



func _physics_process(delta):
	
	# manage the animations
	#Door 1
	if $Lever_door1.is_active:
		$Door1_start.is_open = true
		$Door1_end.is_open = true
	else:
		$Door1_start.is_open = false
		$Door1_end.is_open = false
		
	#Door 2
	if $Lever_door2.is_active:
		$Door2_start.is_open = true
		$Door2_end.is_open = true
	else:
		$Door2_start.is_open = false
		$Door2_end.is_open = false
	
	pass
