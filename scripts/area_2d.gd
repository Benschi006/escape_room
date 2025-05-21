extends Area2D

var entered = false

@onready var e_key: Sprite2D = $EKey
@onready var icon: Sprite2D = $Icon

func _ready() -> void:
	e_key.hide()
	icon.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()

func _process(delta):
	if entered == true and Input.is_action_just_pressed("E"):
		icon.show()
