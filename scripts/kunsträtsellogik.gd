extends Node2D
@onready var kunsträtsel: Node2D = $"."
@onready var target_color_rect: ColorRect = $TargetColorRect
@onready var mixed_color_rect: ColorRect = $MixedColorRect
@onready var red_slider: HSlider = $Redslider
@onready var green_slider: HSlider = $Greenslider
@onready var blue_slider: HSlider = $Blueslider
@onready var icon: Sprite2D = $"../Icon"
@onready var checkbutton: Button = $checkbutton

@onready var result_lable: Label = $"Result Lable"
@onready var safe: LineEdit = $Safe




var target_color: Color
func _ready(): 
	generate_new_target_color()
	update_mixed_color()

	red_slider.connect("value_changed",Callable(self,"update_mixed_color"))
	green_slider.connect("value_changed",Callable(self,"update_mixed_color"))
	blue_slider.connect("value_changed",Callable(self,"update_mixed_color"))
	checkbutton.connect("pressed",Callable(self,"check_result"))

func generate_new_target_color():
	target_color=Color(
	randf_range(0,1),
	randf_range(0,1),
	randf_range(0,1)
	)
	target_color_rect.color= target_color
	result_lable.text=""
	safe.hide()

func update_mixed_color(_value=0):
	var mixed_color=Color(
		red_slider.value/255.0,
		green_slider.value/255.0,
		blue_slider.value/255.0,
	)
	mixed_color_rect.color =mixed_color

func check_result():
	var mixed_color=mixed_color_rect.color
	var diff = abs(target_color.r - mixed_color.r) + abs(target_color.g- mixed_color.g)+ abs(target_color.b- mixed_color.b)
	
	if diff< 0.5:
		safe.show()
		result_lable.text="Richtig"
		safe.text="Der Code für den Safe ist: 42 !!!"
		safe.editable=false
	else: 
		result_lable.text="Versuchs Nochmal"


func _on_visibility_changed() -> void:
	pass # Replace with function body.
