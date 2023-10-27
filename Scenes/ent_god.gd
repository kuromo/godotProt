extends CharacterBody2D

@onready var hpCopmonent = get_node("healthComponent")

func _ready():
	pass
	
func onHit(dmg):
	hpCopmonent.damage(dmg)

func onDeath():
	queue_free()
	
