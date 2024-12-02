extends Area2D
class_name  PlayerProjectile

@export var speed: float = 250
@export var pierce: bool = true

@export var damage: float = 25

func _ready() -> void:
    add_to_group('player_projectile')

func _physics_process(delta: float) -> void:
    # print(damage)
    position.y -= speed * delta;
    if damage <= 0 || position.y < -1750 :
        queue_free()
        