extends Area2D

var entered = false
var gefüttert = false

@onready var schliessen: Button = $"../schliessen"
@onready var e_key_2: Sprite2D = $"../EKey2"
@onready var code_r_4: Sprite2D = $"../CodeR4"


func _on_body_entered(body: Node2D) -> void:
	entered = true
	if gefüttert == true:
		e_key_2.show()


func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key_2.hide()

func _on_schliessen_pressed() -> void:
	schliessen.hide()
	code_r_4.hide()

func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E") and gefüttert == true:
		schliessen.show()
		code_r_4.show()


func _on_nehmen_pressed() -> void:
	gefüttert = true
