extends Node2D
class_name PlayerHordeController


var hoard_count: int = 0
var hoard_level: int = 1
const player_hoard_group: String = "_PlayerHoardGroup"

@onready var target_location: float = position.x

@export var speed: float = 100.0

@onready var cam: Camera2D = get_viewport().get_camera_2d()

@onready var view_to_world = get_canvas_transform().affine_inverse()

@export var horde_member: PackedScene


func _physics_process(delta: float) -> void:
	global_position.x = move_toward(global_position.x, target_location, speed)
	global_position.x = clampf(global_position.x, -600, 600) # slightly larger then the border, but prevents the horde from taking to long to respond

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		target_location = (view_to_world * event.position).x
	if event is InputEventMouseMotion:
		target_location = get_global_mouse_position().x
	if event.is_action_pressed('debug'):
		spawn()

func _ready() -> void:
	spawn()

	
func spawn():
	print('spawning')
	var new_member: PlayerHordeMember = horde_member.instantiate()
	new_member.health *=  (hoard_level * 10)
	new_member.damage *= (hoard_level * 10)
	new_member.position = position + Vector2(randi_range(-10,10),randi_range(-20,20))
	new_member.add_to_group(player_hoard_group)
	get_parent().add_child(new_member)
	hoard_count += 1
	merge()

func merge():
	if hoard_count > 10:
		hoard_level += 1
		hoard_count = 0
		get_tree().call_group(player_hoard_group, 'queue_free')
		spawn()
	
		
