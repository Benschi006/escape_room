extends Area2D

var entered = false

@onready var e_key: Sprite2D = $EKey2
@onready var project_capture_15_: Sprite2D = $"ProjectCapture(15)"


func _ready() -> void:
	e_key.hide()
	project_capture_15_.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		project_capture_15_.show()
func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		project_capture_15_.hide()

func _process(delta):
	testE()
	testEsc()
