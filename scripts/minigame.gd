extends Node2D

@onready var passwordplayer: CharacterBody2D = $password_player
@onready var ziel: Area2D = $Ziel
@onready var label: Label = $Label
@onready var passwordbox: LineEdit = $passwordbox


var movement_pattern = [
	"up", "up", "right", "right", "down", "down", "left", "left",
	"up", "up", "right", "down", "right", "down", "left", "left",
	"up", "up", "right", "right", "down", "left", "up", "right", "down"
]

var current_step = 0
var in_ziel = false

func _ready():
	passwordbox.hide()
	label.text = "Bewege dich so: ⬆️ ⬆️ ➡️ ➡️ ⬇️ ⬇️ ⬅️ ⬅️ ⬆️ ⬆️ ➡️ ⬇️ ➡️ ⬇️ ⬅️ ⬅️ ⬆️ ⬆️ ➡️ ➡️ ⬇️ ⬅️ ⬆️ ➡️ ⬇️ und drücke dann Enter!!!"
	passwordplayer.position = Vector2(100, 50)
	current_step = 0
	in_ziel = false

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		passwordplayer.position.y -= 10
		_check_step("up")
	elif Input.is_action_just_pressed("ui_down"):
		passwordplayer.position.y += 10
		_check_step("down")
	elif Input.is_action_just_pressed("ui_left"):
		passwordplayer.position.x -= 10
		_check_step("left")
	elif Input.is_action_just_pressed("ui_right"):
		passwordplayer.position.x += 10
		_check_step("right")

	if Input.is_action_just_pressed("ente") and in_ziel and current_step == movement_pattern.size():
		passwordbox.text = "Passwort für Lehrer-Pc: !§$@€/]}[]+#"
		passwordbox.show()
		passwordbox.grab_focus()
		passwordbox.select_all()
		passwordbox.editable = false

func _check_step(direction: String):
	if current_step < movement_pattern.size() and movement_pattern[current_step] == direction:
		current_step += 1
	else:
		current_step = 0  # falsch gelaufen → zurücksetzen

func _on_Ziel_body_entered(body):
	if body == passwordplayer:
		in_ziel = true

func _on_Ziel_body_exited(body):
	if body == passwordplayer:
		in_ziel = false
