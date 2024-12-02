extends Area2D
class_name  BuffBarrel
var health: float = 10

var speed: float = 100

@onready var buffTex: Sprite2D = $"%BuffTexture"
@onready var HPDisplay: Label = $Label

func _ready() -> void:
	area_entered.connect(areaEntered)
	
func setTexture(tex: Texture2D):
	var buffimg = $"%BuffTexture"
	buffimg.texture = tex
	print(buffimg.texture)
	# buffTex.texture = tex

func _physics_process(delta: float):
	position.y += speed * delta
	HPDisplay.text = str(health)

func areaEntered(area: Area2D):
	if area.is_in_group('player_projectile'):
		var proj: PlayerProjectile = area as PlayerProjectile
		health -= proj.damage
		if proj.pierce:
			proj.damage -= health
		else: 
			proj.damage = 0
		print(health)
		if health <= 0:
			queue_free()        
