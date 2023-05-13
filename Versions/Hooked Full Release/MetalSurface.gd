extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var i = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	if i == 1:
		i += 1
		return
	elif body.name == "Tip":
		pass
	pass # Replace with function body.
