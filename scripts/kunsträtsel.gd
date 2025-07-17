extends Area2D
var entered = false

@onready var fb_noCode: Sprite2D = $FarbenvergleicherNoCode
@onready var e_key: Sprite2D = $EKey
@onready var kunsträtsel: Node2D = $kunsträtsel
@onready var schliessen: Button = $schliessen
@onready var farbenvergleicher_code: Sprite2D = $FarbenvergleicherCode

var isDone = false

func _ready() -> void:
	e_key.hide()
	fb_noCode.hide()
	kunsträtsel.hide()
	var rätsel_node = get_node("kunsträtsel")
	rätsel_node.rätsel_done.connect(checkDone)

func _on_body_entered(body: Node2D) -> void:
	e_key.show()
	entered = true
	
func _on_body_exited(body: Node2D) -> void:
	e_key.hide()
	entered = false

func _on_schliessen_pressed() -> void:
	closeAll()

func closeAll():
	fb_noCode.hide()
	farbenvergleicher_code.hide()
	get_node("kunsträtsel/TargetColorRect").hide()
	get_node("kunsträtsel/MixedColorRect").hide()
	get_node("kunsträtsel/Redslider").hide()
	get_node("kunsträtsel/Greenslider").hide()
	get_node("kunsträtsel/Blueslider").hide()
	get_node("schliessen").hide()

func checkDone():
	isDone = true

func testE():
	if Input.is_action_just_pressed("E") and entered == true and isDone == false:
		fb_noCode.show()
		kunsträtsel.show()
		schliessen.show()
	elif Input.is_action_just_pressed("E") and entered == true and isDone == true:
		farbenvergleicher_code.show()
		schliessen.show()

func testEsc():
	if Input.is_action_just_pressed("esc") and entered == true:
		fb_noCode.hide()
		kunsträtsel.hide()

func _process(delta):
	testE()
	testEsc()
