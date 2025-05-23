extends Area2D

@onready var prompt: Sprite2D = $"../prompt"
var entered = false

@onready var key_prompt: AnimationPlayer = $"../../keyPrompt"

func _ready() -> void:
	prompt.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	var entered = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	var entered = false
	
func _process(delta: float) -> void:
	if entered == true:
		key_prompt.play("appear")
	else:
		key_prompt.play("RESET")
