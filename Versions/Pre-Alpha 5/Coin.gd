extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/AnimatedSprite.animation = "rotate"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://GameOver.tscn");
	pass # Replace with function body.
