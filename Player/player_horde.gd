extends Node2D

@onready var target_location: float = position.x

@export var speed: float = 100.0

@onready var cam: Camera2D = get_viewport().get_camera_2d()

@onready var view_to_world = get_canvas_transform().affine_inverse()

@onready var bullet = preload("res://Player/bullet.tscn")

var time_accumulated = 0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position.x = move_toward(global_position.x, target_location, speed)
	global_position.x = clampf(global_position.x, -600, 600) # slightly larger then the border, but prevents the horde from taking to long to respond
	#print(global_position.x)

# read mouse/ touch input -Aaron
func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		target_location = (view_to_world * event.position).x
	if event is InputEventMouseMotion:
		target_location = get_global_mouse_position().x
	
func _process(delta):
	time_accumulated += delta
	#adjust when player gets buffs
	var rate = 0.1
	if(time_accumulated >= rate):
		var bullets = bullet.instantiate()
		bullets.position = position
		bullets.position.y -= 125
		get_parent().add_child(bullets)
		time_accumulated = 0
	
