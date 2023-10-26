extends Node2D
class_name healthComponent

@export var maxHP = 100
var currHP
var percentHP


func _ready():
	currHP = maxHP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



	
	
func damage(dmg):
	currHP -= dmg
	print("healtctrl dmg: " + str(dmg) + " hp after:" + str(currHP))
	if(currHP <= 0):
		owner.onDeath()

	
func updateHPBar():
	percentHP = int((float(currHP) / maxHP) * 100)
#	hpBar.value = percentHP
#
#	if(percentHP >= 60):
#		hpBar.set_tint_progress("29ad00c7")
#	elif(percentHP < 50 && percentHP >= 25):
#		hpBar.set_tint_progress("c66300c7")
#	elif(percentHP < 25):
#		hpBar.set_tint_progress("910000c7")
