extends Node

signal world_one_load
signal world_two_load

func _on_load_world_1_pressed() -> void:
	emit_signal("world_one_load") # Emit the signal



func _on_load_world_2_pressed() -> void:
	emit_signal("world_two_load")
