extends Area3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		Global.cheese_count += 1
		print("Cheese collected!" + str(Global.cheese_count))
		queue_free()
		$Coin.play()
		
