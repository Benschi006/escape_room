extends Area2D

var entered = false
var safe_progress = 0

@onready var e_key: Sprite2D = $"../EKey"
@onready var label: Label = $"../Label"
@onready var line_edit: LineEdit = $"../LineEdit"
@onready var schliessen: Button = $"../schliessen"
@onready var safe_closed: Sprite2D = $"../SafeClosed"
@onready var safe_offen_leer: Sprite2D = $"../SafeOffenLeer"
@onready var safe_offen: Sprite2D = $"../SafeOffen"
@onready var nehmen: Button = $"../nehmen"

func _ready() -> void:
	line_edit.text_submitted.connect(code_entered)

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	closeAll()

func _on_nehmen_pressed() -> void:
	safe_progress = 2
	safe_offen_leer.show()
	safe_offen.hide()
	nehmen.hide()

func code_entered(text: String) -> void:
	if text == "42":
		safe_progress = 1
		safe_closed.hide()
		line_edit.hide()
		nehmen.show()
		safe_offen.show()
		label.hide()

func closeAll():
	schliessen.hide()
	safe_closed.hide()
	safe_offen.hide()
	safe_offen_leer.hide()
	line_edit.hide()
	label.hide()

func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		get_tree().paused = true
		if safe_progress == 0:
			safe_closed.show()
			line_edit.show()
			label.show()
			schliessen.show()
		elif safe_progress == 1:
			safe_offen.show()
			schliessen.show()
			nehmen.show()
		elif safe_progress == 2:
			safe_offen_leer.show()
			schliessen.show()
