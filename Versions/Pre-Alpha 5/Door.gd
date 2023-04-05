extends Node2D
export var is_open = false
var target_lever_reference = null;
var endpoint_door_reference = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_open:
		$Area2D/AnimatedSprite.animation = "open"
	else:
		$Area2D/AnimatedSprite.animation = "closed"
	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	#player reference 
	get_tree().get_root().get_node("Main/Player").position = endpoint_door_reference.position + Vector2(50,0);
	pass # Replace with function body.
