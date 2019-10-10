extends Node

#func _ready():
	###
#pass

func _process(delta):
	if Global.spoonFound == true:
		$Spoon.hide()
	else:
		$Spoon.show()
	if Global.fireOut == true:
		$FireOut.show()
		$DiamondKey.modulate = Color(255,255,255,255)
	else:
		$FireOut.hide()
	if Global.DiamondKeyFound == true:
		$DiamondKey.hide()
	pass

func _on_KitchenDoor_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		get_tree().change_scene("Kitchen.tscn")
	pass 


func _on_Spoon_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		$Spoon.hide()
		var spoon = "Spoon"
		Global.add_inventory(spoon)
		print(Global.inventory)
		Global.spoonFound = true
		$GUI/PopupDialog.show()
		$GUI/PopupDialog/Label.text = str("Found a spoon")
	pass # replace with function body


func _on_ArrowLeft_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		get_tree().change_scene("Foyer.tscn")
	pass # replace with function body


func _on_LockBox_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		if Global.inventory.has("DiamondKey") == true:
			Global.boxUnlocked = true
			print("unlocked")
		if Global.boxUnlocked == false:
			$GUI/PopupDialog.show()
			$GUI/PopupDialog/Label.text = str("It's locked")
		elif Global.boxUnlocked == true:
			print("Pop up with wisdom")
	pass # replace with function body


func _on_DiamondKey_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		if Global.fireOut == false:
			$GUI/PopupDialog.show()
			$GUI/PopupDialog/Label.text = str("There's something in there, I need to put out the fire to get it")
		else:
			$DiamondKey.hide()
			var dKey = "DiamondKey"
			Global.add_inventory(dKey)
			print(Global.inventory)
			Global.DiamondKeyFound = true
			$GUI/PopupDialog.show()
			$GUI/PopupDialog/Label.text = str("Found a key, it has a diamond shape on it")
	pass # replace with function body
