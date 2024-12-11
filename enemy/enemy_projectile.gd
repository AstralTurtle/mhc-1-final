extends Area2D
class_name  EnemyProjectile

@export var speed: float = 400
@export var pierce: bool = true

@export var damage: float = 25

func _ready() -> void:
	add_to_group('enemy_projectile')

func _physics_process(delta: float) -> void:
	# print(damage)
	position.y += speed * delta;

func _on_body_entered(body):
	if body is PlayerHordeMember:
		(body as PlayerHordeMember).take_damage(damage)
		queue_free()

		
