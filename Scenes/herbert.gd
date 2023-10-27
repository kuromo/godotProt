extends CharacterBody2D

@onready var hpCopmonent = get_node("healthComponent")

const projectile = preload("res://Scenes/enemy_projectile.tscn")
@export var rof = 0.2
@export var projSpawnPoints = 5
@export var projRadius = 10

@export var rotaSpeed = 20
@export var directionChangeInterval = 30
var rotaDirection = 1 # 1 colockwise, -1 counterclockwise
var directionChangeTimer = 0

@onready var shotTimer = $shotTimer
@onready var rotator = $Rotator



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
		
func _physics_process(delta):
	directionChangeTimer += delta
	if directionChangeTimer >= directionChangeInterval:
		directionChangeTimer = 0
		rotaDirection *= -1
		
	var newRota = rotator.rotation_degrees + rotaSpeed * rotaDirection * delta
	rotator.rotation_degrees = fmod(newRota, 360)

func _on_shot_timer_timeout():
	
	for r in rotator.get_children():
		var proj = projectile.instantiate()
		get_parent().add_child(proj)
		proj.position = r.global_position
		proj.rotation = r.global_rotation
		
		
func onHit(dmg):
	hpCopmonent.damage(dmg)

func onDeath():
	queue_free()

