extends Area2D

# reference to EKey sprite
@onready var e_key: Sprite2D = $EKey
# instance of AnimationPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# boolean to check if a body enters the area
var entered = false

# do this on start
func _ready() -> void:
	e_key.hide() # hides the sprite

# when something exits the area
func _on_body_exited(body: Node2D):
	#animation_player.play("RESET")
	e_key.hide()
	entered = false

# when something enters the area
func _on_body_entered(body: Node2D):
	#animation_player.play("appear")
	e_key.show()
	entered = true
