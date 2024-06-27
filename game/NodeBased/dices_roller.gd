extends PanelContainer

@onready var _dice1 = $"MarginContainer/VBoxContainer/Dice"
@onready var _dice2 = $"MarginContainer/VBoxContainer/Dice2"

signal two_sides_have_changed
signal two_dices_have_stopped

var dice_1_changed_side = false
var dice_2_changed_side = false

var dice_1_stopped_changing_sides = false
var dice_2_stopped_changing_sides = false

func roll_dices() -> void:
	_dice1.toss_a_dice()
	_dice2.toss_a_dice()
	
func get_dice_1_actual_side():
	return _dice1.get_actual_side()
	
func get_dice_2_actual_side():
	return _dice2.get_actual_side()

func intitialize_dices(first_dice_number_of_sides, second_dice_number_of_sides):
	_dice1.change_number_of_sides(first_dice_number_of_sides)
	_dice2.change_number_of_sides(second_dice_number_of_sides)


func dice_1_changed_side_signal_handler():
	dice_1_changed_side = true
	dices_two_sides_changed_handler()

func dice_2_changed_side_signal_handler():
	dice_2_changed_side = true
	dices_two_sides_changed_handler()

func dices_two_sides_changed_handler():
	if (dice_1_changed_side == true) and (dice_2_changed_side == true):
		dice_1_changed_side = false
		dice_2_changed_side = false
		two_sides_have_changed.emit()


func dice_1_stop_signal_handler():
	dice_1_stopped_changing_sides = true
	two_dices_stoped_handler()

func dice_2_stop_signal_handler():
	dice_2_stopped_changing_sides = true
	two_dices_stoped_handler()

func two_dices_stoped_handler():
	var first_condition = dice_1_stopped_changing_sides == true
	var second_condition = dice_2_stopped_changing_sides == true
	
	if first_condition and second_condition:
		dice_1_stopped_changing_sides = false
		dice_2_stopped_changing_sides = false
		two_dices_have_stopped.emit()


func _ready():
	_dice1.connect("dice_changed_side", dice_1_changed_side_signal_handler)
	_dice2.connect("dice_changed_side", dice_2_changed_side_signal_handler)

	_dice1.connect("dice_stopped_changing_sides", dice_1_stop_signal_handler)
	_dice2.connect("dice_stopped_changing_sides", dice_2_stop_signal_handler)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
