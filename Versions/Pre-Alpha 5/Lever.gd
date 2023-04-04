extends Node2D
export var is_active = false;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_active:
		$Area2D/AnimatedSprite.animation = "inactive"
	else:
		$Area2D/AnimatedSprite.animation = "active"
	pass



func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if is_active:
		is_active = false
	else:
		is_active = true
	
	pass # Replace with function body.
