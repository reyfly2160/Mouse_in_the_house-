extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../SleepyLittleMouse".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Node3D.rotate_y(0.5 * delta)


func _on_button_pressed() -> void:
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$"../UI/1MinTimer".start(120)
	$Node3D/Camera3D.current = false
