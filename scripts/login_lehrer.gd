extends Control

@onready var line_editusername: LineEdit = $LineEditusername
@onready var line_edit_password: LineEdit = $LineEditPassword
@onready var check_button: CheckButton = $CheckButton
@onready var label: Label = $CheckButton/Label


var login_successful = false

signal login_successful_signal

var valid_username = "Admin"
var valid_password = "!§$@€/]}[]+#"

func _ready():
	check_button.toggled.connect(_on_check_login)
	line_editusername.text = "Admin"
	line_editusername.editable = false

func _on_check_login(button_pressed: bool) -> void:
	if not button_pressed:
		return  # Nur reagieren, wenn Button gerade aktiviert wurde (nicht ausgeschaltet)

	var username = "Admin"
	var password = line_edit_password.text.strip_edges()

	if password == valid_password:
		login_successful = true
		label.text = "Login erfolgreich!"
		label.add_theme_color_override("font_color", Color.GREEN)
		emit_signal("login_successful_signal")
	else:
		login_successful = false
		label.text = "Falscher Benutzername oder Passwort!"
		label.add_theme_color_override("font_color", Color.RED)
