extends CharacterBody2D
class_name PlayerHordeMember
@onready var center: PlayerHordeController  = get_parent().get_node('PlayerHordeController')

@export var speed: float =  100 

@export var health: float = 5
@export var damage: float = 2

var temp: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
    if center:
        velocity = (center.position - position).normalized() * speed
    move_and_slide()

func take_damage(damage: float):
    health -= damage
    if health < 0:
        queue_free()