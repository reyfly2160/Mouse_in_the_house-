extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var score = Global.cheese_count
	$Label2.text = str(score)


func _on_button_pressed() -> void:
	hide()
	$"../Menu".show()
	$"../Menu/Node3D/Camera3D".current = true
