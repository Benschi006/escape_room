extends Area2D

signal ziel_entered

func _on_body_entered(body: Node2D) -> void:
	emit_signal("ziel_entered")
