extends KinematicBody2D

var velocity = Vector2(0,1)
var speed = 300
const gravity = 2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity += Vector2(0,gravity)
	var colision_info = move_and_collide(velocity.normalized() * delta * speed)
