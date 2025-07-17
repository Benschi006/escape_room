extends Area2D

var entered2 = false
@onready var e_key: Sprite2D = $"../EKey"

func _on_body_entered(body: Node2D) -> void:
	entered2 = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered2 = false
	e_key.hide()
	
func _process(delta: float) -> void:
	if entered2 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_2.tscn")
			entered2 = false
