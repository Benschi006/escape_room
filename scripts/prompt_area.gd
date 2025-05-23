extends Area2D

var entered = false

@onready var e_key: Sprite2D = $"../../stickyNote/sticky/EKey"
@onready var sticky_note_fenster: Sprite2D = $"../../stickyNote/sticky/StickyNoteFenster"


func _ready() -> void:
	e_key.hide()
	sticky_note_fenster.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		sticky_note_fenster.show()
func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		sticky_note_fenster.hide()

func _process(delta):
	testE()
	testEsc()
