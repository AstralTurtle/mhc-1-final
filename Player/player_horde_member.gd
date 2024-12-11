extends CharacterBody2D
class_name PlayerHordeMember
@onready var center: PlayerHordeController  = get_parent().get_node('PlayerHordeController')
@export var sprites: Array[Texture2D] = []
@export var speed: float =  100 

@export var health: float = 5
@export var damage: float = 2

var attackThreshold = 5
var attackTimer = 0

var temp: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if center:
		velocity = (center.position - position).normalized() * speed
	move_and_slide()
	attackTimer += delta * randf_range(0.75, 1.25)
	if (attackTimer >= attackThreshold):
		shoot()
		attackTimer = 0

func _process(delta: float) -> void:
	$ProgressBar.value = health
	$ProgressBar.max_value = center.health * center.hoard_level * 10
	# print("healh: " +str(health) )
	print("dmg" + str(damage))

func take_damage(damage: float):
	health -= damage
	if health < 0:
		center.member_died()
		queue_free()
		

func _ready() -> void:
	$Sprite2D.texture = sprites[randi_range(0,sprites.size()-1)]


func shoot():
	var proj = center.projectile.instantiate() as PlayerProjectile
	proj.global_position = global_position
	proj.damage = damage
	get_tree().root.add_child(proj)
	updateStats()

func updateStats():
	attackThreshold = center.attackMinimum + randf_range(-0.5, 0.5)
	damage = center.damage
	speed = center.member_speed
