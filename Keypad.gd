extends PopupDialog


var one = 0
var two = 0
var three = 0
var four = 0
var input = str(one,two,three,four)

var mouseClicks = 0

func _ready():
	#button input handling
	for button in get_tree().get_nodes_in_group("keypadButtons"):
		button.connect("pressed", self, "_which_button_pressed", [button]) 
	
func _process(delta):
	$keypad/Label.text = str(input)

func _which_button_pressed(button):
	mouseClicks += 1
	if mouseClicks == 1:
		one = button.name
	elif mouseClicks == 2:
		two = button.name
	elif mouseClicks == 3:
		three = button.name
	elif mouseClicks == 4:
		four = button.name
		input = str(one,two,three,four)
		if input == str("5731"):
			Global.cabinetUnlocked = true
			self.hide()
		else:
			one = 0
			two = 0
			three = 0
			four = 0
			mouseClicks = 0
	input = str(one,two,three,four)



