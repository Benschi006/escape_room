extends Area2D

@onready var e_key: Sprite2D = $EKey
@onready var hausi_heft_offen: Sprite2D = $HausiHeftOffen

var entered = false
var e_pressed = false

func _ready() -> void:
	e_key.hide()

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()
	
func checkClickable():
	if entered == true and Input.is_action_just_pressed("E"):
		e_pressed = true

func _process(delta: float) -> void:
	checkClickable()
	if e_pressed == true and entered == true:
		hausi_heft_offen.show()
		get_tree().paused = true
	elif e_pressed == false:
		hausi_heft_offen.hide()

func _on_schliessen_pressed() -> void:
	e_pressed = false
	get_tree().paused = false
