extends Particles2D

const resource = preload("res://.import/Pixel.png-4aea18dd107917fe5a12669910fb6942.stex");

# You can uncomment the _ready() implementation below if you only want 
# the animation to start as soon as you set the sprite via initialize() 
# (and still see the animation in the editor).
func _ready():
	emitting = true
	pass
	

# Sets the particle systems emission shape, the sprite texture and 
# the amount of particles and starts the emission.
func initialize(sprite : Texture):
	
	process_material.set_shader_param("emission_box_extents", 
		Vector3(sprite.get_width() / 2.0, sprite.get_height() / 2.0, 1))
	
	process_material.set_shader_param("sprite", sprite)
	
	amount = sprite.get_width() * sprite.get_height()
	
	emitting = true
