extends Area2D
class_name Enemy
@export var speed = 150
@export var damage =5
@export var health = 2

const player_hoard_group: String = "_PlayerHoardGroup"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	global_position.y += speed * delta
	if global_position.y > 750:
		get_tree().call_group(player_hoard_group, 'take_damage', damage)
		queue_free()

func die():
	queue_free()

# func _on_visible_on_screen_notifier_2d_screen_exited():
	

func _on_body_entered(body):
	if body is PlayerHordeMember:
		(body as PlayerHordeMember).take_damage(damage)

func _on_area_entered(area: Area2D):
	if area.is_in_group('player_projectile'):
		var proj: PlayerProjectile = area as PlayerProjectile
		if proj.pierce:
			var temp = proj.damage
			proj.damage -= health
			health -= temp
		else: 
			health -= proj.damage
			proj.damage = 0
		print(health)
		if health <= 0:
			queue_free()  
		
