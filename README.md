# SHBGDSimpleTurretAimSystem - Simple Turret Aim System dengan Godot Engine

## Software Apakah Ini?

SHBGDSimpleTurretAimSystem adalah script Godot Engine yang menunjukkan cara membuat Simple Turret Aim System dengan Godot Engine.

## Screenshot

![ScreenShot](.readme-assets/SHBGDSimpleTurretAimSystem-1.png?raw=true)

## Cara Mencoba Kode Ini

Untuk mencoba kode ini, Anda memerlukan Godot Engine v3.5.

Download dan install software tersebut...

Kemudian buka project ini dan jalankan.

## Pendahuluan

Kali ini saya akan memberi contoh cara membuat turret aim system sederhana.

Turret aim system ini bisa mengarahkan muzzle ke titik yang ditunjukkan oleh kursor di ruang 3D.

Berbeda dengan yang predictive, yang sederhana ini tidak bisa menjamin bahwa jika bullet dari turret dilontarkan maka posisi jatuhnya bullet akan tepat pada titik yang ditunjukkan kursor di ruang 3D.

## Cara Kerja

Yang dilakukan kode di bawah adalah pada event _input, kita mengonversi koordinat kursor mouse kita dari koordinat layar ke koordinat world.

Selama event _process berlangsung, lakukan aim.

Adapun aim sendiri dilakukan dengan melakukan look_at ke posisi target.

Setelah itu, kita mengonversinya ke euler dan menggunakan method rotate_y dan rotate_x.

## Struktur Project

Untuk melihat struktur project game ini, silakan buka project ini di Godot Engine.