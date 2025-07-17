extends Area2D

var entered3 = false
@onready var e_key: Sprite2D = $"../EKey"

func _on_body_entered(body: Node2D) -> void:
	entered3 = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered3 = false
	
func _process(delta: float) -> void:
	if entered3 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_3.tscn")
			entered3 = false
