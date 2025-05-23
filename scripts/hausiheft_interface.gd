extends Control

@onready var hausi_heft: Control = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_schließen_pressed() -> void:
	get_tree().paused = false
	animation_player.play("hide")
