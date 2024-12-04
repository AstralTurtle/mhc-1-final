extends Node2D
@export var enemies: Array[PackedScene] = []
@onready var EnemySpawner = $EnemySpawner
@onready var timer = $EnemySpawnTimer

@onready var Buffs: BuffManager = $BuffManager

var enemiesKilled: int = 0

var counter = 0
@export var decrement = 0.2

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass

func signalDeath():
	print("signal")
	# EnemyDied.emit()
	Buffs.toNextBuff += 1
	
func _on_enemy_spawn_timer_timeout() -> void:
	var e: Enemy = enemies.pick_random().instantiate()
	
	e.global_position = Vector2(randf_range(-500,500),-1700)
	e.tree_exited.connect(signalDeath)

	e.damage += floor((enemiesKilled / 10))
	e.health += floor((enemiesKilled/10))

	EnemySpawner.add_child(e)
	counter += 1
	if counter > 10:
		timer.wait_time -= decrement
