extends CharacterBody2D

@onready var hpCopmonent = get_node("healthComponent")

func _ready():
	pass
	
func onHit(dmg):
	hpCopmonent.damage(dmg)
#	currHP -= dmg
#	print(self.name+": you hit me for " + str(dmg) + " now i have:" + str(currHP) )
#	if(currHP <= 0):
#		onDeath()

func onDeath():
	queue_free()
	
