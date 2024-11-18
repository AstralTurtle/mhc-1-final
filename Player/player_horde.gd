extends Node2D

@onready var target_location: int = position.x

@export var speed: float = 100.0

@onready var cam: Camera2D = get_tree().root.get_node('World/Camera2D')


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Debug the mouse position
#func _draw():
	#draw_circle(get_viewport().get_mouse_position(), 5, Color.RED)
	#draw_circle(cam.get_screen_to_world(get_viewport().get_mouse_position()), 5 , Color.BLUE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position.x = move_toward(global_position.x, target_location, speed)
	#_draw()

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		target_location = event.position.x
	if event is InputEventMouseMotion:
		target_location = get_global_mouse_position().x
		
