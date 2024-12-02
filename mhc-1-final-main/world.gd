extends Node2D
@export var enemies: Array[PackedScene] = []
@onready var EnemySpawner = $EnemySpawner
@onready var timer = $EnemySpawnTimer

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass
	
func _on_enemy_spawn_timer_timeout() -> void:
	var e = enemies.pick_random().instantiate()
	e.global_position = Vector2(randf_range(-900,900),-1700)
	EnemySpawner.add_child(e)
