extends Node2D

@export var textures: Array[Texture2D] = []
@export var barrel: PackedScene


@export var buffThreshold = 3
var toNextBuff = 0;
@export var buffIncrease = 5;
@export var buffHealth = 10;
@onready var controller: PlayerHordeController = get_tree().root.get_node("World/PlayerHorde/PlayerHordeController")


func _physics_process(delta: float) -> void:
	if toNextBuff >= buffThreshold:
		spawnBuff()
		toNextBuff = 0;
		buffThreshold += buffIncrease


func spawnBuff() -> void:
	# var num := randi_range(0,textures.size()-1)
	var num = 1
	var newbarrel: BuffBarrel = barrel.instantiate()
	newbarrel.tree_exited.connect(buff.bind(num))
	newbarrel.global_position = global_position
	newbarrel.setTexture(textures[num])

			
func phone() -> void:
	controller.spawn()

func buff(num: int) -> void:
	match num:
		0:
			pass
		1:
			controller.spawn()

func _ready() -> void:
	# print(textures[0])
	call_deferred('spawnBuff')