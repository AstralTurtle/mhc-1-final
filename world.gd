extends Node2D
@export var enemies: Array[PackedScene] = []
@onready var EnemySpawner = $EnemySpawner
@onready var timer = $EnemySpawnTimer

@onready var Buffs: BuffManager = $BuffManager
@onready var player: PlayerHordeController = $PlayerHorde/PlayerHordeController

var enemiesKilled: int = 0

var counter = 0
@export var decrementPercent = 0.95
@export var difficultyMod = 10

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.hoard_count <= 0:
		print("ending game")
		ScoreManager.calculate(enemiesKilled, player.hoard_level)
		get_tree().change_scene_to_file("res://Player/MainMenu.tscn")
	pass
	
func _physics_process(delta: float) -> void:
	pass


	
func _on_enemy_spawn_timer_timeout() -> void:

	var e = enemies.pick_random().instantiate()
	e.global_position = Vector2(randf_range(-440,440),-1700)

	#e.tree_exited.connect(signalDeath)

	e.damage += floor((enemiesKilled / difficultyMod))
	e.health += floor((enemiesKilled/difficultyMod))

	EnemySpawner.add_child(e)
	counter += 1
	if counter > difficultyMod:
		timer.wait_time *= decrementPercent
