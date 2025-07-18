extends Area2D

var entered = false
var pressed = false

@onready var schliessen: Button = $CanvasLayer/schliessen
@onready var exit_code_eingabe: LineEdit = $"CanvasLayer/exit code"
@onready var label: Label = $CanvasLayer/Label
@onready var e_key: Sprite2D = $EKey
@onready var _1000040789: Sprite2D = $"CanvasLayer/1000040789"
@onready var fail_label: Label = $"CanvasLayer/fail label"

func _ready() -> void:
	exit_code_eingabe.text_submitted.connect(checkExitCode)

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()
	
func checkPressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _on_schliessen_pressed() -> void:
	pressed = false
	exit_code_eingabe.hide()
	schliessen.hide()
	label.hide()
	get_tree().paused = false

func checkExitCode(code: String) -> void:
	if code == "7165":
		_1000040789.show()
		exit_code_eingabe.hide()
		schliessen.hide()
		label.hide()
	else:
		fail_label.show()
		await get_tree().create_timer(3).timeout
		fail_label.hide()

func _process(delta: float) -> void:
	checkPressed()
	if entered == true and Input.is_action_just_pressed("E"):
		exit_code_eingabe.show()
		schliessen.show()
		label.show()
		get_tree().paused = true
		
