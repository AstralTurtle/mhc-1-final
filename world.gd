extends Node2D
@export var enemies: Array[PackedScene] = []
@onready var EnemySpawner = $EnemySpawner
@onready var timer = $EnemySpawnTimer


@onready var Buffs: BuffManager = $BuffManager
@onready var player: PlayerHordeController = $PlayerHorde/PlayerHordeController

@export var timerScene: PackedScene

var enemiesKilled: int = 0

var counter = 0
 
@export var decrementPercent: float = 0.95
@export var difficultyMod: float = 10

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

func countDeath():
	enemiesKilled +=1
	Buffs.toNextBuff += 1

	
func _on_enemy_spawn_timer_timeout() -> void:

	var e = enemies.pick_random().instantiate()
	e.global_position = Vector2(randf_range(-440,440),-1700)

	e.tree_exited.connect(countDeath)

	e.damage += floor((enemiesKilled + 1 / difficultyMod))
	e.health += floor((enemiesKilled+1/difficultyMod))

	EnemySpawner.add_child(e)
	counter += 1
	
	if counter > difficultyMod:
		timer.wait_time *= decrementPercent
		if timer.wait_time < 1:
			timer.wait_time = 5
			var new_timer: Timer = timerScene.instantiate()
			new_timer.wait_time = randf_range(2,10)
			new_timer.timeout.connect(_on_enemy_spawn_timer_timeout)
