extends Node2D

class_name ProjectileSpawner


# requiers two child nodes:
@export var shotTimer : Timer # timers timeout event needs to be connected to the projectileSpawners instance
@export var rotator : Node2D

const projectile = preload("res://Scenes/enemy_projectile.tscn")
@export var rof = 0.2
@export var projSpawnPoints = 5
@export var projRadius = 10

@export var rotaSpeed = 20
@export var directionChangeInterval = 30
var rotaDirection = 1 # 1 colockwise, -1 counterclockwise
var directionChangeTimer = 90

@export var ignoreParentRotation: bool = true 


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(projSpawnPoints):
		var spawnPoint = Node2D.new()
		var angle = i * (2 * PI / projSpawnPoints)
		var pos = Vector2(projRadius * cos(angle), projRadius * sin(angle))
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotator.add_child(spawnPoint)
		
	shotTimer.wait_time = rof
	shotTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ignoreParentRotation:
		var parentRota = get_parent().rotation
		set_rotation(- parentRota)


func _physics_process(delta):
	directionChangeTimer += delta
	if directionChangeTimer >= directionChangeInterval:
		directionChangeTimer = 0
		rotaDirection *= -1

	var newRota = (rotator.rotation_degrees + rotaSpeed * rotaDirection * delta)
	rotator.rotation_degrees = fmod(newRota, 360)


func _on_timer_timeout():
	for r in rotator.get_children():
		var proj = projectile.instantiate()
		get_tree().root.get_child(0).add_child(proj)
		proj.position = r.global_position
		proj.rotation = r.global_rotation
