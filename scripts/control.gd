extends Control
@onready var line_editusername: LineEdit = $LineEditusername
@onready var line_edit_password: LineEdit = $LineEditPassword
@onready var check_button: CheckButton = $CheckButton
@onready var label: Label = $CheckButton/Label

func _ready():
	check_button.pressed.connect(_on_check_login)
		

func _on_check_login():
	var username=line_editusername.text.strip_edges()
	var password= line_edit_password.text.strip_edges()
