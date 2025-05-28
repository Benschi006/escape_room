extends Area2D
var entered = false
@onready var e_key: Sprite2D = $EKey
@onready var dunkel: Sprite2D = $Dunkel

func _ready() -> void:
	e_key.hide()
	dunkel.hide()
func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false
func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		dunkel.show()
func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		dunkel.hide()
