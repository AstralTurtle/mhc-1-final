extends Area2D
class_name  PlayerProjectile

@export var speed: float = 250
@export var pierce: bool = true

@export var damage: float = 25

func _ready() -> void:
	add_to_group('player_projectile')

func _physics_process(delta: float) -> void:
	# print(damage)
	global_position.y -= speed * delta;
	if (damage <= 0):
		queue_free()

func _on_area_exited(area: Area2D) -> void:
	queue_free()
