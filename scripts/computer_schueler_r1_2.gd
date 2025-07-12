extends Area2D

var entered = false
var pressed = false
var username_correct = false
var password_correct = false
var login_successful = false
var cd_collected = false
var pc_progress = 0

@onready var e_key: Sprite2D = $"../EKey"
@onready var screens: Node2D = $"../screens"
@onready var login_screen: Sprite2D = $"../screens/login screen"
@onready var schliessen: Button = $"../schliessen"
@onready var login: Node2D = $"../login"
@onready var line_edit_user: LineEdit = $"../login/LineEdit_user"
@onready var line_edit_pass: LineEdit = $"../login/LineEdit_pass"
@onready var einloggen: Button = $"../login/einloggen"
@onready var katze_bildschirm: Sprite2D = $"../screens/KatzeBildschirm"
@onready var nur_mit_cd_screen: Sprite2D = $"../screens/NurMitCdScreen"


func _ready() -> void:
	line_edit_user.text_submitted.connect(checkUsername)
	line_edit_pass.text_submitted.connect(checkPassword)
	var cd_node = get_node_or_null("$../../CD/Area2D")
	cd_node.collected.connect(is_cd_collected)

func checkUsername(user: String) -> void:
	if user == "Katze":
		username_correct = true
		print("user good")
	else:
		username_correct = false
		print("user failed")

func checkPassword(password: String) -> void:
	if password == "12Miau!":
		password_correct = true
		print("pass good")
	else:
		password_correct = false
		print("pass failed")

func checkLogin() -> void:
	if username_correct == true and password_correct == true:
		pc_progress = 1
		login_successful = true
		password_correct = false
	else:
		print("login failed")

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func checkEntf() -> void:
	if Input.is_action_just_pressed("entf"):
		pc_progress = 2
		katze_bildschirm.hide()
		nur_mit_cd_screen.show()
		print("entf pressed")

func is_cd_collected() -> void:
	cd_collected = true

func checkPressed() -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true
		if entered == true and pressed == true:
			if pc_progress == 0:
				login_screen.show()
				login.show()
				schliessen.show()
				get_tree().paused = true
			elif pc_progress == 1:
				katze_bildschirm.show()
				checkEntf()
			elif pc_progress == 2:
				if cd_collected:
					pc_progress = 3
				else:
					nur_mit_cd_screen.show()
			elif pc_progress == 3:
				pass


func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	pressed = false
	screens.hide()
	schliessen.hide()
	login.hide()

func _on_einloggen_pressed() -> void:
	checkLogin()
	if login_successful == true:
		login_screen.hide()
		login.hide()
		katze_bildschirm.show()

func _process(delta: float) -> void:
	checkPressed()
	checkEntf()
	print(pc_progress)
	
