extends Node2D
@export var enemies: Array[PackedScene] = []
var difficulty: float = 0;
@export var increaseDifficultyTime: float= 30
@export var difficultyIncreaseAmount: float = 0.5
@export var spawnTime: float = 15;
var timer: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func spawn() -> void:
#	put spawning code here
	#Only interesting idea I had is to increase the ciel of the random based on time
#	oh also set hp dynamically
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	timer += delta
	if (timer > spawnTime - difficulty) :
		for i in range(int(1 + difficulty)):
			spawn()
	if (timer > increaseDifficultyTime):
		difficulty += difficultyIncreaseAmount
