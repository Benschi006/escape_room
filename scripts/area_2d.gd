extends Area2D

var entered = false

@onready var e_key: Sprite2D = $EKey
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hausi_heft_offen: Sprite2D = $HausiHeftOffen

func _ready() -> void:
	e_key.hide()
	hausi_heft_offen.hide()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		hausi_heft_offen.show()

func testEsc():
	if Input.is_action_just_pressed("enter") and entered == true:
		
		hausi_heft_offen.hide()

func _process(delta):
	testE()
