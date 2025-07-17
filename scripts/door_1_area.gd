extends Area2D

var entered1 = false
@onready var e_key: Sprite2D = $"../EKey"

func _on_body_entered(body: Node2D) -> void:
	entered1 = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered1 = false
	e_key.hide()
	
func _process(delta: float) -> void:
	if entered1 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_1_2.tscn")
			entered1 = false
			
