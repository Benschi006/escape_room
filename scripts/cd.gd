extends Area2D

signal cd_collected

@onready var cd: Sprite2D = $Cd
@onready var e_key: Sprite2D = $EKey

func _ready() -> void:
	e_key.hide()

var cd_taken = false
var entered = false

func _on_body_entered(body: Node2D) -> void:
	entered = true
	if cd_taken == false:
		e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _process(delta):
	if entered == true and Input.is_action_just_pressed("E") and cd_taken == false:
		cd.hide()
		e_key.hide()
		cd_taken = true
		emit_signal("cd_collected")
