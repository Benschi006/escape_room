extends Area2D

var entered = false
var pressed = false
var taken = false

signal collected

@onready var cd: Sprite2D = $"../Cd"
@onready var e_key: Sprite2D = $"../EKey"

func _on_body_entered(body: Node2D) -> void:
	entered = true
	if taken == false:
		e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func checkPressed() -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true
		taken = true
		emit_signal("collected")
		cd.hide()

func _process(delta: float) -> void:
	checkPressed()
	
