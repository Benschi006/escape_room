extends Area2D


var entered = false
var pressed = false

@onready var e_key: Sprite2D = $"../EKey"
@onready var schulbuch_ges_offen: Sprite2D = $"../SchulbuchGesOffen"
@onready var schliessen: Button = $"../schliessen"

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _on_schliessen_pressed() -> void:
	pressed = false
	schulbuch_ges_offen.hide()
	schliessen.hide()


func checkPressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _process(delta: float) -> void:
	checkPressed()
	if entered == true and pressed == true:
		schulbuch_ges_offen.show()
		schliessen.show()
