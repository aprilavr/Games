extends Node

var health
var score

export (PackedScene) var Friend
export (PackedScene) var Blast

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	#start game timer
	$Timer.start()
	#initialize health and score
	score = 0
	health = 3
	#Spawn NPC characters on Path Follow Node
	_friend_spawn()
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#use water blaster when space bar pressed
	if Input.is_action_just_pressed("ui_accept"):
		var blast = Blast.instance()
		add_child(blast)
		blast.global_position = Vector2($Player.get_position().x + 60, $Player.get_position().y - 10)
		get_node("BubblePop").play()
	#Print current score to GUI
	$GUI/HBoxContainer/Score/Label.text = str("$", Global.totalScore)


func _friend_spawn():
	var i=0
	while [i<10]:
		#spawn Friend character
		$FriendsPath/FriendSpawnLocation.set_offset(randi(0))
		var friend = Friend.instance()
		add_child(friend)
		if i <5:
			friend.position = $FriendsPath/FriendSpawnLocation.position
		else:
			friend.position = Vector2($FriendsPath/FriendSpawnLocation.get_position().x + (50 * i), $FriendsPath/FriendSpawnLocation.get_position().y)
		i+=1
		if i<10:
			continue
		else:
			break

func _on_Timer_timeout():
	$GUI/HBoxContainer.hide()
	$HappyMusic.stop()
	$LevelEnd.play()
	#show end of level pop up
	$PopupLayer/LevelResults.visible = true
	#set Level Score and add to Total Score
	score = Global.totalScore
	Global.totalScore = score
	#display level score and total score
	$PopupLayer/LevelResults/TotalScore.text = str("Today's profits: $", Global.totalScore)
	pass
#signal for Player damage
func _on_Area2D_body_entered(body):
	$Hit.play()
	if health == 3:
		$GUI/HBoxContainer/HP/Heart3.hide()
	elif health == 2:
		$GUI/HBoxContainer/HP/Heart2.hide()
	elif health == 1:
		$GUI/HBoxContainer/HP/Heart1.hide()
	elif health == 0:
		#game over handling
		score = 0
		Global.totalScore = score
		var level = 1
		Global.levelRestart = level
		get_tree().change_scene("GameOver.tscn") #change to Game Over
	health = health - 1
	pass 
