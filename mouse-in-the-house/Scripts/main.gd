extends Node3D

func _ready() -> void:
	if not Global.sfx.is_connected(_on_sfx):
		Global.sfx.connect(_on_sfx)

func _on_sfx() -> void:
	$Coin.play()
