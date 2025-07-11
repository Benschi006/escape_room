extends Area2D

var entered2 = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	entered2 = true

func _on_body_exited(body: Node2D) -> void:
	entered2 = false
	
func _process(delta: float) -> void:
	if entered2 == true:
		if Input.is_action_just_pressed("E"):
			get_tree().change_scene_to_file("res://scenes/hauptszenen/raum_2.tscn")
			entered2 = false
