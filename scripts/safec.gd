extends Area2D
var entered=false

@onready var e_key: Sprite2D = $EKey
@onready var icon_2: Sprite2D = $Icon2
@onready var icon: Sprite2D = $Icon
@onready var line_edit_2: LineEdit = $LineEdit2
@onready var line_edit: LineEdit = $LineEdit
@onready var icon_3: Sprite2D = $Icon3
@onready var button: Button = $Button
@onready var icon_4: Sprite2D = $Icon4
@onready var icon_5: Sprite2D = $Icon5
@onready var check_button: CheckButton = $CheckButton


func _ready() -> void:
	e_key.hide()
	icon.hide()
	line_edit_2.hide()
	line_edit.hide()
	line_edit_2.editable = false
	line_edit_2.text="Safe Code Eingeben"
	icon_3.hide()
	check_button.hide()
	check_button.pressed.connect(_on_check_login)
	button.hide()
	icon_4.hide()
	icon_5.hide()
	check_button.connect("pressed",Callable(self,"check_result"))

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true


func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false


func testE():
	if Input.is_action_just_pressed("E") and entered == true:
		icon.show()
		line_edit_2.show()
		line_edit.show()
		check_button.show()

func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		icon.hide()
		line_edit.hide()
		line_edit_2.hide()		


func _on_check_login():
	var valid_code = "42"
	var username = line_edit.text.strip_edges()
	if username == valid_code:
		icon_3.show()
		icon_2.hide()
		line_edit.hide()
		line_edit_2.hide()
		check_button.hide()
		button.show()
		icon_4.show()
func check_result():
	icon_5.show()
func _process(delta):
	testE()
	testEsc()
