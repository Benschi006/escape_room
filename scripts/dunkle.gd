extends Area2D

var entered = false
var licht_an = false

@onready var e_key: Sprite2D = $EKey
@onready var dunkel: Sprite2D = $Dunkel12k
@onready var player: CharacterBody2D = $"../../objekte (y sort)/player"
@onready var label: Label = $Label


func _ready() -> void:
	e_key.hide()
	dunkel.show()
func _on_body_entered(body: Node2D) -> void:
	if licht_an == false:
		e_key.show()
	entered = true
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false
	
func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		licht_an = true
		dunkel.hide()
		label.hide()


func _process(delta):
	dunkel.global_position = player.global_position - Vector2(0,75)
	testE()
