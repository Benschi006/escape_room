extends Area2D


var entered = false
var pressed = false

@onready var e_key: Sprite2D = $"../EKey"
@onready var schulbuch_ges_offen: Sprite2D = $"../buchseiten/SchulbuchGesOffen"
@onready var schliessen: Button = $"../schliessen"
@onready var line_edit: LineEdit = $"../eingabe/LineEdit"
@onready var buchseite_falsch: Sprite2D = $"../buchseiten/BuchseiteFalsch"
@onready var eingabe: Node2D = $"../eingabe"
@onready var buchseiten: Node2D = $"../buchseiten"

func _ready() -> void:
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(text: String) -> void:
	if text == "271":
		schulbuch_ges_offen.show()
		eingabe.hide()
	else:
		buchseite_falsch.show()
		eingabe.hide()

func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _on_schliessen_pressed() -> void:
	pressed = false
	eingabe.hide()
	buchseiten.hide()
	schliessen.hide()

func checkPressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true

func _process(delta: float) -> void:
	checkPressed()
	if entered == true and pressed == true:
		eingabe.show()
		schliessen.show()
