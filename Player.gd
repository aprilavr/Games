extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 350
const JUMP_HEIGHT = -600
var motion = Vector2()

func _physics_process(delta):
	#add gravity
	motion.y += GRAVITY
	#movement key input handling
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$PlayerSprite.flip_h = false
	
		if $AnimationPlayer.current_animation != "run" && $AnimationPlayer.current_animation != "Jump":
			$AnimationPlayer.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$PlayerSprite.flip_h = true
		if $AnimationPlayer.current_animation != "run" && $AnimationPlayer.current_animation != "Jump":
			$AnimationPlayer.play("run")
	else:
		motion.x = 0
		$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("Jump")
			motion.y = JUMP_HEIGHT
	motion = move_and_slide(motion, UP)
	pass

