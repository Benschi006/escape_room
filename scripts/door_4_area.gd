extends Area2D

var entered4 = false

func _on_body_entered(body: Node2D) -> void:
	entered4 = true

func _on_body_exited(body: Node2D) -> void:
	entered4 = false
	
func _process(delta: float) -> void:
	if entered4 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_4.tscn")
