extends CanvasLayer

var GUIarray = []

func _process(delta):
	for i in Global.inventory:
		var node = str("Inv",Global.inventory.bsearch(i) + 1)
		var nodePath= str("ColorRect/",node)
		var imagePath = str("res://Images/",i,".png")
		get_node(nodePath).texture = load(imagePath)
		GUIarray.push_back(i)
	pass
		
	

func _on_Arrow_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		$ColorRect.show()
		$ArrowDown.show()
		$Arrow.hide()
	pass # replace with function body


func _on_ArrowDown_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		$ColorRect.hide()
		$ArrowDown.hide()
		$Arrow.show()
	pass # replace with function body


func _on_NotifyTimer_timeout():
	$PopupDialog.hide()
	pass # replace with function body


func _on_PopupDialog_visibility_changed():
	$NotifyTimer.start()
	pass # replace with function body


func _on_Inv1_gui_input(ev):
	if Input.is_action_just_pressed("mouse_click"):
		Global.current_selected = GUIarray[0]
		print(Global.current_selected)
	pass # replace with function body
