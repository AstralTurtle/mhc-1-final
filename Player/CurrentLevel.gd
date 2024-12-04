extends Label

@onready var controller: PlayerHordeController = get_tree().root.get_node("World/PlayerHorde/PlayerHordeController")

func _process(delta: float) -> void:
	text = 'Merge Level: ' + str(controller.hoard_level)
