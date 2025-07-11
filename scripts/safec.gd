extends Area2D
var entered=false

@onready var e_key: Sprite2D = $EKey
@onready var icon_2: Sprite2D = $Icon2
@onready var icon: Sprite2D = $Icon
@onready var line_edit_2: LineEdit = $LineEdit2
@onready var line_edit: LineEdit = $LineEdit
@onready var icon_3: Sprite2D = $Icon3

@onready var icon_4: Sprite2D = $Icon4
@onready var icon_5: Sprite2D = $Icon5
@onready var check_button: CheckButton = $CheckButton
@onready var button: Button = $Button
@onready var button_pressed = false
@onready var icon_6: Sprite2D = $Icon6



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
	icon_6.hide()
	

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
		icon_5.hide()
	

func _process(delta):
	testE()
	testEsc()


func _on_button_pressed() -> void:
	pass # Replace with function body.
	icon_5.show()
	
	button_pressed=true
	icon_6.show()
	icon_4.hide()
	button.hide()

func checkPressed() -> bool:
	if button_pressed == true:
		return true
	else:
		return false
