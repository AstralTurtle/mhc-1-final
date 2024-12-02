extends Area2D
class_name  PlayerProjectile

var speed: float = 250
var pierce: bool = true

var damage: float = 25

func _ready() -> void:
    add_to_group('player_projectile')

func _physics_process(delta: float) -> void:
    # print(damage)
    position.y -= speed * delta;
    if (damage <= 0):
        queue_free()
        