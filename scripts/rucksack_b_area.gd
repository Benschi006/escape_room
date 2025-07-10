extends Area2D

var entered = false
var pressed = false

@onready var e_key: Sprite2D = $"../EKey"
@onready var ex: Sprite2D = $Ex
@onready var schliessen: Button = $schliessen


func _ready() -> void:
	e_key.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func checkClickable():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _process(delta: float) -> void:
	checkClickable()
	if pressed == true and entered == true:
		ex.show()
		schliessen.show()
		get_tree().paused = true
	elif pressed == false:
		get_tree().paused = false
		ex.hide()
		schliessen.hide()

func _on_schliessen_pressed() -> void:
	pressed = false
