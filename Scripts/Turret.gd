extends Spatial

export var ray_length = 1000

onready var turret_horizontal = get_node("Base/Body")
onready var turret_vertical = get_node("Base/Body/Muzzle")
onready var cam = get_node("/root/World/Camera")

var target_pos = Vector3()

func _input(event):
	if event is InputEventMouseMotion:
		var result = cam_to_world(event.position)
		if result.size() > 0 and result["position"] != null:
			target_pos = result["position"]
	pass

func _process(delta):
	aim(target_pos)
	pass
	
func _physics_process(delta):
	pass
	
func aim(tgt_pos):
	turret_vertical.look_at(tgt_pos, Vector3.UP)
	turret_horizontal.rotate_y(turret_vertical.transform.basis.get_euler().y)
	turret_vertical.rotate_x(turret_vertical.transform.basis.get_euler().x)
	pass
	
func cam_to_world(pos):
	return get_world().direct_space_state.intersect_ray(cam.project_ray_origin(pos), cam.project_ray_origin(pos) + cam.project_ray_normal(pos) * ray_length)
