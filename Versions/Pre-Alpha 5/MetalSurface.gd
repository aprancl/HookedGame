extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#change the velocity of the object, so that it bounces off of the surface. 
	#var body_shape_node = body.shape_owner_get_owner(body_shape_owner)
	#print(body_shape_node)
	
	#body.velocity.x += body.velocity.x * sign(body.velocity.x)
	# I think that I might need to cast the boject so that I can access the data member 
	pass # Replace with function body.
