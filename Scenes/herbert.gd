extends CharacterBody2D

@onready var hpBar = get_node("HPBar")

var maxHP = 2000
var currHP
var percentHP

func _ready():
	currHP = maxHP
	
func onHit(dmg):
	currHP -= dmg
	updateHPBar()
	print(self.name+": you hit me for " + str(dmg) + " now i have:" + str(currHP) )
	if(currHP <= 0):
		onDeath()

func onDeath():
	queue_free()
	
func updateHPBar():
	percentHP = int((float(currHP) / maxHP) * 100)
	hpBar.value = percentHP
	
	if(percentHP >= 60):
		hpBar.set_tint_progress("29ad00c7")
	elif(percentHP < 50 && percentHP >= 25):
		hpBar.set_tint_progress("c66300c7")
	elif(percentHP < 25):
		hpBar.set_tint_progress("910000c7")
	

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
