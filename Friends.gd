extends RigidBody2D

export var min_speed = 100
export var max_speed = 275

var friend_Select = ["Nancy", "Kevin", "Karen", "Steve", "Susan"]

var velocity = Vector2(rand_range(100, 275), 0)

func _process(delta):
	move(delta)

func _ready():
	#randomly select different Friend sprites for NPC runners
	randomize()
	var choice
	choice = friend_Select[randi() % friend_Select.size()]
	if choice == "Nancy":
		$Nancy.show()
	elif choice == "Kevin":
		$Kevin.show()
	elif choice == "Karen":
		$Karen.show()
	elif choice == "Steve":
		$Steve.show()
	elif choice == "Susan":
		$Susan.show()
	else:
		$Nancy.show()
#Friend running movement
func move(delta):
	global_position += velocity * delta

#When hit with water, remove instance
func _on_Friends_body_entered(body):
	if body is RigidBody2D:
		self.queue_free()

	
