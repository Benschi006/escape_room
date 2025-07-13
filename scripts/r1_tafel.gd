extends Area2D

var entered = false

@onready var r_1_tafelanschrift: Sprite2D = $"../R1Tafelanschrift"
@onready var e_key: Sprite2D = $"../EKey"
@onready var schliessen: Button = $"../schliessen"



func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()


func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _on_schliessen_pressed() -> void:
	schliessen.hide()
	r_1_tafelanschrift.hide()


func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		r_1_tafelanschrift.show()
		schliessen.show()
	
