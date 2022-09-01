# GDSMPTRRTM - Simple Turret Aim System dengan Godot Engine

## Software Apakah Ini?

GDSMPTRRTM adalah script Godot Engine yang menunjukkan cara membuat Simple Turret Aim System dengan Godot Engine.

## Cara Mencoba Kode Ini

Untuk mencoba project ini, download folder ini, kemudian buka di Godot Engine 3.4.

Selanjutnya jalankan.

## Pendahuluan

Kali ini kita akan belajar membuat turret aim system sederhana.

Turret aim system ini bisa mengarahkan muzzle ke titik yang ditunjukkan oleh kursor di ruang 3D.

Berbeda dengan yang predictive, yang sederhana ini tidak bisa menjamin bahwa jika bullet dari turret dilontarkan maka posisi jatuhnya bullet akan tepat pada titik yang ditunjukkan kursor di ruang 3D.

## Cara Kerja

Yang dilakukan kode di bawah adalah pada event _input, kita mengonversi koordinat kursor mouse kita dari koordinat layar ke koordinat world.

Selama event _process berlangsung, lakukan aim.

Adapun aim sendiri dilakukan dengan melakukan look_at ke posisi target.

Setelah itu, kita mengonversinya ke euler dan menggunakan method rotate_y dan rotate_x. Perhatikan node yang melakukan itu.

## Penjelasan

```
# file: Turret.gd

# extend dari Spatial
extends Spatial

# panjang ray untuk "picking"
export var ray_length = 1000

# begin: assign node ke variabel
onready var turret_horizontal = get_node("Base/Body")
onready var turret_vertical = get_node("Base/Body/Muzzle")
onready var cam = get_node("/root/World/Camera")
# end: assign node ke variabel

# posisi target
var target_pos = Vector3()

# ketika event input terjadi
func _input(event):
    # jika event adalah gerakan mouse
    if event is InputEventMouseMotion:
        # dapatkan posisi world dari kursur
        var result = cam_to_world(event.position)
        if result.size() > 0 and result["position"] != null:
            target_pos = result["position"]
    pass

# tiap frame. delta adalah selisih waktu
func _process(delta):
    # lakukan pembidikan
    aim(target_pos)
    pass

# abaikan
func _physics_process(delta):
    pass

# method untuk membidik ke arah tgt_pos
func aim(tgt_pos):
    turret_vertical.look_at(tgt_pos, Vector3.UP)
    turret_horizontal.rotate_y(turret_vertical.transform.basis.get_euler().y)
    turret_vertical.rotate_x(turret_vertical.transform.basis.get_euler().x)
    pass

# konversi koordinat layar ke koordinat world
func cam_to_world(pos):
    return get_world().direct_space_state.intersect_ray(cam.project_ray_origin(pos), cam.project_ray_origin(pos) + cam.project_ray_normal(pos) * ray_length)
```

# 
