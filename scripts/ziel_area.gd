extends Area2D

var entered = false

@onready var lehrer_pc_passwort: Sprite2D = $"../LehrerPcPasswort"

signal minigame_done

func _on_body_entered(body: Node2D) -> void:
	entered = true
	lehrer_pc_passwort.show()
	print("minigame done")
	emit_signal("minigame_done")
