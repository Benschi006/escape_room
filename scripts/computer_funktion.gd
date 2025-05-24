extends Area2D

var entered = false
var cd_access_granted = false
var entf_gedrueckt = false

@onready var e_key: Sprite2D = $EKey2
@onready var project_capture_15_: Sprite2D = $"ProjectCapture(15)"
@onready var project_capture_22_: Sprite2D = $"ProjectCapture(22)"
@onready var project_capture_21_: Sprite2D = $"ProjectCapture(21)"
@onready var line_editusername: LineEdit = $"../Login/LineEditusername"
@onready var line_edit_password: LineEdit = $"../Login/LineEditPassword"
@onready var check_button: CheckButton = $"../Login/CheckButton"
@onready var cd: Sprite2D = $"../../CD/areacd/cd"
@onready var e_key2: Sprite2D = $"../../CD/areacd/EKey"
@onready var areacd: Area2D = $"../../CD/areacd"
@onready var password_minigame: Node2D = $"../PasswordMinigame"
@onready var programm_cd: Sprite2D = $"Programm Cd"

func _ready() -> void:
	programm_cd.hide()
	password_minigame.hide()
	areacd.monitoring = false
	cd.hide()
	e_key2.hide()
	e_key.hide()
	project_capture_15_.hide()
	project_capture_22_.hide()
	project_capture_21_.hide()  # Du hast hier versehentlich 2x .22, korrigiert zu .21
	line_editusername.hide()
	line_edit_password.hide()
	check_button.hide()
	var control_node = get_node_or_null("/root/raum1/Logik1/computer/Login")
	if control_node:
		control_node.login_successful_signal.connect(check_login_and_show_pc)
	var cd_node = get_node_or_null("/root/raum1/Logik1/CD/areacd")  # Passe Pfad an
	if cd_node:
		cd_node.cd_collected.connect(_on_cd_collected)

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true

func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func check_login_and_show_pc():
	var control_node = get_node("/root/raum1/Logik1/computer/Login")
	if control_node.login_successful:
		project_capture_15_.show()
		project_capture_22_.show()
		project_capture_21_.show()
		line_editusername.hide()
		line_edit_password.hide()
		check_button.hide()
		areacd.monitoring = true

func _on_cd_collected():
	cd_access_granted = true


func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		if cd_access_granted == true:
			programm_cd.show()
			password_minigame.show()
		else:
			var control_node = get_node("/root/raum1/Logik1/computer/Login")
			if control_node.login_successful:
				if entf_gedrueckt == true:
					project_capture_22_.show()
				else:
					project_capture_21_.show()
					project_capture_22_.show()
			else:
				project_capture_15_.show()
				line_editusername.show()
				line_edit_password.show()
				check_button.show()

func testentf():
	if Input.is_action_just_pressed("entf"):
		project_capture_21_.hide()
		cd.show()
		entf_gedrueckt = true

func testesc():
	if Input.is_action_just_pressed("esc"):
		programm_cd.hide()
		password_minigame.hide()
		project_capture_15_.hide()
		project_capture_22_.hide()
		project_capture_21_.hide()
		line_editusername.hide()
		line_edit_password.hide()
		check_button.hide()

func _process(delta):
	testE()
	testentf()
	testesc()
