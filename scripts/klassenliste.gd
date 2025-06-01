extends Area2D

var entered
var pressed

@onready var e_key: Sprite2D = $EKey
@onready var liste_offen: Sprite2D = $listeOffen

func _ready() -> void:
	e_key.hide()
	entered = false

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false
	
func _on_schliessen_pressed() -> void:
	pressed = false
	
func checkEpressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _process(delta: float) -> void:
	checkEpressed()
	if pressed == true and entered == true:
		liste_offen.show()
		get_tree().paused = true
	elif pressed == false:
		liste_offen.hide()
		get_tree().paused = false
		
