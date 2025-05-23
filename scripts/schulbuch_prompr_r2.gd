extends Area2D

@onready var e_key: Sprite2D = $EKey


func _ready() -> void:
	e_key.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
