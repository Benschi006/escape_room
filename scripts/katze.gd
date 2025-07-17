extends Area2D

var entered = false
var futter_taken = false
var katze_gefüttert = false

@onready var katze_steht: Sprite2D = $"../../../KatzeSteht"
@onready var katze_frisst: Sprite2D = $"../../../KatzeFrisst"
@onready var bowl_full: Sprite2D = $"../../../BowlFull"
@onready var bowl_empty: Sprite2D = $"../../../BowlEmpty"
@onready var vent_open: Sprite2D = $"../../../VentOpen"
@onready var vent_closed: Sprite2D = $"../../../VentClosed"
@onready var e_key: Sprite2D = $"../EKey"
@onready var label: Label = $"../Label"
@onready var notiz_label: Label = $"../notiz_label"

func _on_body_entered(body: Node2D) -> void:
	entered = true
	if katze_gefüttert == false:
		e_key.show()

func _on_nehmen_pressed() -> void:
	futter_taken = true

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		if katze_gefüttert == false:
			if futter_taken:
				bowl_empty.hide()
				bowl_full.show()
				await get_tree().create_timer(3).timeout
				vent_closed.hide()
				vent_open.show()
				await get_tree().create_timer(1).timeout
				katze_steht.show()
				await get_tree().create_timer(2).timeout
				katze_steht.hide()
				katze_frisst.show()
				await get_tree().create_timer(1).timeout
				notiz_label.show()
				await get_tree().create_timer(3).timeout
				notiz_label.hide()
				katze_gefüttert = true
			else: 
				label.show()
				await get_tree().create_timer(3).timeout
				label.hide()
