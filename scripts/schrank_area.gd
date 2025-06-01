extends Area2D

var entered = false
var pressed = false

@onready var e_key: Sprite2D = $EKey
@onready var line_edit: LineEdit = $schloss_input/LineEdit
@onready var label_falsch: Label = $Label_falsch
@onready var schliessen: Button = $schloss_input/schliessen
@onready var schloss_input: Node2D = $schloss_input
@onready var ex_notiz: Sprite2D = $ExNotiz1

func _ready() -> void:
	e_key.hide()
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(new_text: String) ->void:
	if new_text == "143":
		ex_notiz.show()
	else:
		label_falsch.show()

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false
	
func check_E_pressed():
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true
		
func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	pressed = false
	ex_notiz.hide()
	label_falsch.hide()
	
func _process(delta: float) -> void:
	check_E_pressed()
	if pressed == true:
		get_tree().paused = true
		schloss_input.show()
	else:
		schloss_input.hide()
