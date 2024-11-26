extends Label

@onready var controller: PlayerHordeController = get_tree().root.get_node("World/PlayerHorde/PlayerHordeController")

func _process(delta: float) -> void:
	text = 'Current Level: ' + str(controller.hoard_level)
