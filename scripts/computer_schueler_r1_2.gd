extends Area2D

var entered = false
var pressed = false
var username_correct = false
var password_correct = false
var login_successful = false
var cd_collected = false
var minigame_completion = false
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
@onready var pacman: Sprite2D = $"../screens/PacmanMitZiel"
@onready var lehrer_pc_passwort: Sprite2D = $"../../minigame/LehrerPcPasswort"
@onready var minigame: Node2D = $"../minigame"
@onready var player_small: CharacterBody2D = $"../../minigame/player small"


func _ready() -> void:
	line_edit_user.text_submitted.connect(checkUsername)
	line_edit_pass.text_submitted.connect(checkPassword)
	var cd_node = get_node_or_null("../../CD/Area2D")
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
	if Input.is_action_just_pressed("entf") and pc_progress == 1:
		pc_progress = 2
		katze_bildschirm.hide()
		nur_mit_cd_screen.show()
		print("entf pressed")

func is_cd_collected():
	cd_collected = true

func _on_ziel_area_body_entered(body: CharacterBody2D) -> void:
	print("ziel entered")
	pc_progress = 4
	lehrer_pc_passwort.show()
	pacman.hide()
	player_small.hide()
	minigame_completion = true

func checkPressed() -> void:
	if entered == true and Input.is_action_just_pressed("E"):
		pressed = true
		if entered == true and pressed == true:
			get_tree().paused = true
			if pc_progress == 0:
				login_screen.show()
				login.show()
				schliessen.show()
			elif pc_progress == 1:
				katze_bildschirm.show()
				schliessen.show()
				
				checkEntf()
			elif pc_progress == 2:
				if cd_collected:
					pc_progress = 3
					schliessen.show()
					player_small.global_position = Vector2(417,123)
					player_small.show()
					pacman.show()
				else:
					nur_mit_cd_screen.show()
					schliessen.show()
					
			elif pc_progress == 3:
				if minigame_completion:
					pc_progress = 4
					schliessen.show()
					print(pc_progress)
					lehrer_pc_passwort.show()
					player_small.hide()
					pacman.hide()
					
				else:
					pacman.show()
					player_small.show()
					schliessen.show()
			elif pc_progress == 4:
				lehrer_pc_passwort.show()
				schliessen.show()


func _on_schliessen_pressed() -> void:
	get_tree().paused = false
	pressed = false
	login_screen.hide()
	katze_bildschirm.hide()
	nur_mit_cd_screen.hide()
	lehrer_pc_passwort.hide()
	pacman.hide()
	player_small.hide()
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
	
