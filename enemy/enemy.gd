class_name Enemy extends Area2D

@export var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	global_position.y += speed * delta

func die():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is PlayerHordeController:
		body.die()
		die()

func _on_area_entered(area: Area2D):
	print("hi")
	if area is PlayerProjectile:
		queue_free()
