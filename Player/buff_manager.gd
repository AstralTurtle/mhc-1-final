extends Node2D
class_name BuffManager
@export var textures: Array[Texture2D] = []
@export var barrel: PackedScene

var buffNum = 0

@export var buffThreshold = 3
var toNextBuff = 0;
@export var buffIncrease = 2;
@export var buffHealth = 10;
@onready var controller: PlayerHordeController = get_tree().root.get_node("World/PlayerHorde/PlayerHordeController")


func _physics_process(delta: float) -> void:
	if toNextBuff >= buffThreshold:
		print("buff")
		spawnBuff()
		toNextBuff = 0;
		buffThreshold += buffIncrease


func spawnBuff() -> void:
	buffNum += 1

	var num := randi_range(0,4)
	# var num = 1
	var newbarrel: BuffBarrel = barrel.instantiate()
	newbarrel.tree_exited.connect(buff.bind(num))
	newbarrel.global_position = Vector2(randf_range(-500,500), global_position.y)
	newbarrel.health = buffHealth * buffNum
	newbarrel.setTexture(textures[num % textures.size()])
	get_parent().add_child(newbarrel)

			
func phone() -> void:
	controller.spawn()

func buff(num: int) -> void:
	match num:
		0:
			controller.fire_train()
		1:
			controller.spawn()
		2:
			controller.damage += 5
		3:
			controller.attackMinimum -= 0.25
		4:
			controller.member_speed += 30
		_:
			pass

func _ready() -> void:
	# print(textures[0])
	spawnBuff.call_deferred()

func _on_world_enemy_died() -> void:
	toNextBuff += 1
	print("signal recieved")
	
	
