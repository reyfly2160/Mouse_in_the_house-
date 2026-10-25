extends Node3D

@export var cheese_scene: PackedScene = preload("res://Cheese.tscn")
@export var cheese_count: int = 5
@export var floor_size: Vector2 = Vector2(7.5, 5)

@export var cheese_offset: float = 0.15
@export var ray_height: float = 3.0
@export var ray_depth: float = 20.0

func _ready() -> void:
	randomize()

	if cheese_scene == null:
		push_error("Assign cheese_scene in the Inspector!")
		return
		
	spawn_cheese()

func spawn_cheese() -> void:

	var space_state = get_world_3d().direct_space_state

	for i in range(cheese_count):
		var x = randf_range(-floor_size.x / 2.0, floor_size.x / 2.0)
		var z = randf_range(-floor_size.y / 2.0, floor_size.y / 2.0)

		# Random position in world coordinates
		var point = to_global(Vector3(x, 0.0, z))

		# Cast a ray downward
		var ray_start = point + Vector3.UP * ray_height
		var ray_end = point - Vector3.UP * ray_depth

		var query = PhysicsRayQueryParameters3D.create(
			ray_start,
			ray_end
		)

		query.collision_mask = 1
		query.collide_with_areas = false

		var hit = space_state.intersect_ray(query)

		if hit.is_empty():
			continue

		# Spawn cheese above the surface
		var cheese = cheese_scene.instantiate()
		add_child(cheese)

		cheese.global_position = (
			hit.position + Vector3.UP * cheese_offset
		)


var last_spawn_milestone: int = 0

func _process(_delta: float) -> void:
	if Global.cheese_count >= last_spawn_milestone + 5:
		last_spawn_milestone += 5
		spawn_cheese()
