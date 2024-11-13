extends CharacterBody2D


const SPEED = 50.0
const rotation_speed = 0.4
var momentum = Vector2.ZERO
 


func _physics_process(delta: float) -> void:

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		rotate(direction * rotation_speed)
	var accelerate := Input.get_axis("ui_down","ui_up")
	if accelerate:
		momentum += transform.x * SPEED * accelerate
	velocity = momentum
	momentum = momentum.move_toward(Vector2.ZERO, 0.1)

	move_and_slide()
