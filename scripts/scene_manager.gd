extends CanvasLayer

const gang = preload("res://scenes/hauptszenen/gang.tscn")
const raum1 = preload("res://scenes/hauptszenen/raum_1_2.tscn")
const raum2 = preload("res://scenes/hauptszenen/raum_2.tscn")
const raum3 = preload("res://scenes/hauptszenen/raum_3.tscn")
const raum4 = preload("res://scenes/hauptszenen/raum_4.tscn")

func setPlayerPos(scene_path, x, y):
	var scene = scene_path.instantiate()
	scene.get_node("player").position = Vector2(x,y)
