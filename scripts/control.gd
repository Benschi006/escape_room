extends Control

@onready var line_editusername: LineEdit = $LineEditusername
@onready var line_edit_password: LineEdit = $LineEditPassword
@onready var check_button: CheckButton = $CheckButton
@onready var label: Label = $CheckButton/Label

var login_successful = false

signal login_successful_signal

var valid_username = "Katze"
var valid_password = "12Miau!"

func _ready():
	check_button.pressed.connect(_on_check_login)

func _on_check_login():
	var username = line_editusername.text.strip_edges()
	var password = line_edit_password.text.strip_edges()
	
	if username == valid_username and password == valid_password:
		login_successful = true
		label.text = "Login erfolgreich!"
		label.add_theme_color_override("font_color", Color.GREEN)
		emit_signal("login_successful_signal")
	else:
		login_successful = false
		label.text = "Falscher Benutzername oder Passwort!"
		label.add_theme_color_override("font_color", Color.RED)
