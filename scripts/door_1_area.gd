extends Area2D

var entered1 = false

func _on_body_entered(body: Node2D) -> void:
	entered1 = true

func _on_body_exited(body: Node2D) -> void:
	entered1 = false
	
func _process(delta: float) -> void:
	if entered1 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_1.tscn")
