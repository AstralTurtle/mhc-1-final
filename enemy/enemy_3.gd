extends Enemy

@export var bullet_scene: PackedScene  # EnemyProjectile scene to be set in the inspector
@export var bullet_speed: float = 200  # Speed of the bullet
@export var shoot_interval: float = 2  # Interval between shots in seconds

var shoot_timer: float = 0.0  # Timer to track elapsed time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the shoot timer by adding the delta time
	shoot_timer += delta
	
	# If the timer has reached the shoot interval, shoot a bullet and reset the timer
	if shoot_timer >= shoot_interval:
		shoot_bullet()
		shoot_timer = 0.0  # Reset the timer

# Function to spawn and shoot a bullet downward
func shoot_bullet() -> void:
	var bullet = bullet_scene.instantiate()  # Create a new bullet from the EnemyProjectile scene
	bullet.global_position = global_position + Vector2(0, 60)# Set bullet position to enemy's position
	get_parent().add_child(bullet)  # Add the bullet to the scene
