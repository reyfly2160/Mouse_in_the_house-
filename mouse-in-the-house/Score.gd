extends Control

func _ready() -> void:
	$"1MinTimer".start(60)

func _process(_delta: float) -> void:
	var score = Global.cheese_count
	var time_left = int(ceil($"1MinTimer".time_left))

	var m = time_left / 60
	var s = time_left % 60

	$Label.text = str(score)
	$Label2.text = "%02d:%02d" % [m, s]
