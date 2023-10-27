extends Area2D

@export var projSpeed = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * projSpeed * delta


func _on_lifetime_timeout():
	queue_free()
