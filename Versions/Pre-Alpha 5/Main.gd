extends Node2D
var last_door_entered = null;


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Door 1 pairing
	$Door1_start.endpoint_door_reference = $Door1_end
	$Door1_start.target_lever_reference = $Lever_door1
	$Door1_end.endpoint_door_reference = $Door1_start
	$Door1_end.target_lever_reference = $Lever_door1
	
	
	# Door 2 pairing
	$Door2_start.endpoint_door_reference = $Door2_end
	$Door2_start.target_lever_reference = $Lever_door2
	$Door2_end.endpoint_door_reference = $Door2_start
	$Door2_end.target_lever_reference = $Lever_door2
	
	# Door Puzzle Pairing 
	
	# door wrong a1
	$DoorPuzzle/DoorWrongA1.endpoint_door_reference = $DoorPuzzle/DoorWrongA2
	$DoorPuzzle/DoorWrongA1.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a2
	$DoorPuzzle/DoorWrongA2.endpoint_door_reference = $DoorPuzzle/DoorWrongA3
	$DoorPuzzle/DoorWrongA2.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a3
	$DoorPuzzle/DoorWrongA3.endpoint_door_reference = $DoorPuzzle/DoorWrongA4
	$DoorPuzzle/DoorWrongA3.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a4
	$DoorPuzzle/DoorWrongA4.endpoint_door_reference = $DoorPuzzle/DoorWrongA5
	$DoorPuzzle/DoorWrongA4.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a5
	$DoorPuzzle/DoorWrongA5.endpoint_door_reference = $DoorPuzzle/DoorWrongA6
	$DoorPuzzle/DoorWrongA5.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a6
	$DoorPuzzle/DoorWrongA6.endpoint_door_reference = $DoorPuzzle/DoorWrongA7
	$DoorPuzzle/DoorWrongA6.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a7
	$DoorPuzzle/DoorWrongA7.endpoint_door_reference = $DoorPuzzle/DoorWrongA8
	$DoorPuzzle/DoorWrongA7.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a8
	$DoorPuzzle/DoorWrongA8.endpoint_door_reference = $DoorPuzzle/DoorWrongA9
	$DoorPuzzle/DoorWrongA8.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a9
	$DoorPuzzle/DoorWrongA9.endpoint_door_reference = $DoorPuzzle/DoorWrongA10
	$DoorPuzzle/DoorWrongA9.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a10
	$DoorPuzzle/DoorWrongA10.endpoint_door_reference = $DoorPuzzle/DoorWrongA11
	$DoorPuzzle/DoorWrongA10.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door wrong a11
	$DoorPuzzle/DoorWrongA11.endpoint_door_reference = $DoorPuzzle/DoorWrongA1
	$DoorPuzzle/DoorWrongA11.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door correct 1
	$DoorPuzzle/DoorCorrect1.endpoint_door_reference = $DoorPuzzle/DoorCorrect2
	$DoorPuzzle/DoorCorrect1.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	# door correct 2
	$DoorPuzzle/DoorCorrect2.endpoint_door_reference = $DoorPuzzle/DoorCorrect1
	$DoorPuzzle/DoorCorrect2.target_lever_reference = $DoorPuzzle/LeverDoorPuzzle
	
	
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
	
	
	#Door puzzle
	
	#door wrong 1
	if $DoorPuzzle/LeverDoorPuzzle.is_active:
		$DoorPuzzle/DoorWrongA1.is_open = true
		$DoorPuzzle/DoorWrongA2.is_open = true
		$DoorPuzzle/DoorWrongA3.is_open = true
		$DoorPuzzle/DoorWrongA4.is_open = true
		$DoorPuzzle/DoorWrongA5.is_open = true
		$DoorPuzzle/DoorWrongA6.is_open = true
		$DoorPuzzle/DoorWrongA7.is_open = true
		$DoorPuzzle/DoorWrongA8.is_open = true
		$DoorPuzzle/DoorWrongA9.is_open = true
		$DoorPuzzle/DoorWrongA10.is_open = true
		$DoorPuzzle/DoorWrongA11.is_open = true
		$DoorPuzzle/DoorCorrect1.is_open = true
		$DoorPuzzle/DoorCorrect2.is_open = true
	else:
		$DoorPuzzle/DoorWrongA1.is_open = false
		$DoorPuzzle/DoorWrongA2.is_open = false
		$DoorPuzzle/DoorWrongA3.is_open = false
		$DoorPuzzle/DoorWrongA4.is_open = false
		$DoorPuzzle/DoorWrongA5.is_open = false
		$DoorPuzzle/DoorWrongA6.is_open = false
		$DoorPuzzle/DoorWrongA7.is_open = false
		$DoorPuzzle/DoorWrongA8.is_open = false
		$DoorPuzzle/DoorWrongA9.is_open = false
		$DoorPuzzle/DoorWrongA10.is_open = false
		$DoorPuzzle/DoorWrongA11.is_open = false
		$DoorPuzzle/DoorCorrect1.is_open = false
		$DoorPuzzle/DoorCorrect2.is_open = false
	
	pass
