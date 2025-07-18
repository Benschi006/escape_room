extends Area2D

var pressed = false
var entered = false
var login_success = false
var login_state = 0

@onready var e_key: Sprite2D = $EKey
@onready var anmeldebildschirm: Sprite2D = $Anmeldebildschirm
@onready var schliessen: Button = $schliessen
@onready var line_edit_admin: LineEdit = $LineEdit_ADMIN
@onready var line_edit: LineEdit = $LineEdit
@onready var raum_1_code: Sprite2D = $Raum1Code
@onready var anmelden: Button = $anmelden

func password_submitted() -> void:
	var password = line_edit.text
	if password == ")(zfg8s=?)Fjj[{[()(":
		login_success = true


func _on_anmelden_pressed() -> void:
	password_submitted()
	if login_success:
		login_state = 1
		line_edit.hide()
		line_edit_admin.hide()
		anmeldebildschirm.hide()
		anmelden.hide()
		raum_1_code.show()
	elif login_state == 0:
		line_edit.show()
		line_edit_admin.show()
		anmeldebildschirm.show()
		anmelden.show()


func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	line_edit.hide()
	line_edit_admin.hide()
	anmeldebildschirm.hide()
	anmelden.hide()
	raum_1_code.hide()
	schliessen.hide()


func _on_body_entered(body: Node2D) -> void:
	entered = true
	e_key.show()


func _on_body_exited(body: Node2D) -> void:
	entered = false
	e_key.hide()

func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		get_tree().paused = true
		if login_state == 0:
			anmeldebildschirm.show()
			anmelden.show()
			line_edit.show()
			line_edit_admin.show()
			schliessen.show()
		elif login_state == 1:
			schliessen.show()
			raum_1_code.show()
	
