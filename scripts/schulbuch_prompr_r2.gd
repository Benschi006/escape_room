extends Area2D

var entered = false
var e_pressed = false

@onready var e_key: Sprite2D = $EKey
@onready var schliessen: Button = $seiten_input/schliessen
@onready var line_edit: LineEdit = $seiten_input/LineEdit
@onready var label: Label = $seiten_input/Label
@onready var buchseite_richtig: Sprite2D = $BuchseiteRichtig1
@onready var buchseite_falsch: Sprite2D = $BuchseiteFalsch
@onready var seiten_input: Node2D = $seiten_input

func _ready() -> void:
	e_key.hide()
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(new_text: String) -> void:
	if new_text == "124":
		buchseite_richtig.show()
		schliessen.show()
	else: 
		buchseite_falsch.show()
		schliessen.show()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	e_pressed = false

func check_E_clicked():
	if entered == true and Input.is_action_just_pressed("E"):
		e_pressed = true

func _process(delta: float) -> void:
	check_E_clicked()
	if e_pressed == true:
		get_tree().paused = true
		seiten_input.show()
	elif e_pressed == false:
		seiten_input.hide()
		buchseite_falsch.hide()
		buchseite_richtig.hide()
