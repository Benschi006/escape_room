extends Area2D

var entered = false

@onready var e_key_123: Sprite2D = $EKey123
@onready var anmeldescreen: Sprite2D = $anmeldescreen
@onready var icon: Sprite2D = $Icon
@onready var line_editusername: LineEdit = $"../Login Lehrer/LineEditusername"
@onready var line_edit_password: LineEdit = $"../Login Lehrer/LineEditPassword"
@onready var check_button: CheckButton = $"../Login Lehrer/CheckButton"
@onready var label: Label = $"../Login Lehrer/CheckButton/Label"
@onready var code: LineEdit = $"../Login Lehrer/code"

func _ready() -> void:
	anmeldescreen.hide()
	code.hide()
	code.editable = false
	code.text = "Der RaumCode ist: 7"
	icon.hide()
	line_editusername.hide()
	line_edit_password.hide()
	check_button.hide()
	e_key_123.hide()
	var control_node = get_node_or_null("/root/raum1/Logik1/Lehrer-Pc/Login Lehrer")
	if control_node:
		control_node.login_successful_signal.connect(check_login_and_show_pc)


func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key_123.show()

func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key_123.hide()

func check_login_and_show_pc():
	var control_node = get_node("/root/raum1/Logik1/Lehrer-Pc/Login Lehrer")
	if control_node.login_successful:
		anmeldescreen.hide()
		line_editusername.hide()
		line_edit_password.hide()
		icon.show()
		check_button.hide()
		label.hide()
		code.show()

func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		anmeldescreen.show()
		line_editusername.show()
		line_edit_password.show()
		check_button.show()

func testesc():
	if Input.is_action_just_pressed("esc"):
		anmeldescreen.hide()
		icon.hide()
		line_editusername.hide()
		line_edit_password.hide()
		check_button.hide()
		code.hide()

func _process(delta):
	testesc()
	testE()
