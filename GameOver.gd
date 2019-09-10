extends Node

var randomText

func _ready():
	randomize()
	#randomly select text option each game over
	var randomText = randi() % 3+1
	$DialogueText.show()
	$AngryEmote.show()
	if randomText == 1:
		$DialogueText/Label.text = str("BIG BOSS: \nLet's try something new. \nJump OVER the boxes. Jump ONTO the boxes. When you run INTO the boxes, you damage your Distributor, and my SANITY.")
	elif randomText == 2:
		$DialogueText/Label.text = str("BIG BOSS: \nHere's a suggestion for you. When there's a box in your way, JUMP. \nStop damaging expensive company equipment.")
	elif randomText == 3:
		$DialogueText/Label.text = str("BIG BOSS: \nYou do understand the concept of jumping, right?")

func _process(delta):
	#on mouse click, hide text and pop up game over options
	if Input.is_action_just_pressed("mouse_click"):
		$DialogueText.hide()
		$AngryEmote.hide()
		$TryAgain.show()

#when button pressed, restart current level stored in global variable
func _on_Retry_pressed():
	if Global.levelRestart == 1:
		get_tree().change_scene("Main.tscn")
	elif Global.levelRestart == 2:
		get_tree().change_scene("Level2.tscn")
	elif Global.levelRestart == 3:
		get_tree().change_scene("Level3.tscn")
	pass # replace with function body

#when button pressed, skip to end game screen
func _on_HadEnough_pressed():
	get_tree().change_scene("End.tscn")
	pass 
