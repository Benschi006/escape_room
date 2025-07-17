extends Area2D

var entered = false

@onready var e_key: Sprite2D = $"../EKey"


func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()
	

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		get_tree().change_scene_to_file("res://scenes/hauptszenen/gang.tscn")
		entered = false
