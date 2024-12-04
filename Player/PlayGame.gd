extends Button

@export var game: PackedScene 


func pressed():
    get_tree().change_scene_to_packed(game)