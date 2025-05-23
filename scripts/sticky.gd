extends Area2D

var entered = false


@onready var project_capture_18_: Sprite2D = $"ProjectCapture(18)"
@onready var e_key: Sprite2D = $EKey


func _ready() -> void:
	e_key.hide()
	project_capture_18_.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		project_capture_18_.show()
func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		project_capture_18_.hide()

func _process(delta):
	testE()
	testEsc()
