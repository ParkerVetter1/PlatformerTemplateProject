extends Node

@onready var MainMenuScene = %MainMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMenuScene.connect("world_one_load", Callable(self, "world_one_load_button_pressed"))
	MainMenuScene.connect("world_two_load", Callable(self, "world_two_load_button_pressed"))

func world_one_load_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/level1.tscn")

func world_two_load_button_pressed():
	print("need to make world 2")
