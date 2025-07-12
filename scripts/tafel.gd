extends Area2D

var entered = false
var pressed = false

@onready var schliessen: Button = $schliessen
@onready var e_key: Sprite2D = $"../EKey"
@onready var tafel_hauptfrage: Sprite2D = $TafelHauptfrage

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _on_schliessen_pressed() -> void:
	pressed = false
	tafel_hauptfrage.hide()
	schliessen.hide()

func checkPressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _process(delta: float) -> void:
	checkPressed()
	if entered == true and pressed == true:
		tafel_hauptfrage.show()
		schliessen.show()
