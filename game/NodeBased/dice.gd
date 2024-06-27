extends PanelContainer

@onready var label = $CenterContainer/Label
@onready var timer_whole_roll = $"Timer whole roll"
@onready var timer_dice_one_side_change = $"Timer dice one side change"

signal dice_changed_side
signal dice_stopped_changing_sides

var _numberOfSides: int = 6
var _actualSide: int = 1

func _ready():
	timer_dice_one_side_change.connect("timeout", one_toss)
	timer_whole_roll.connect("timeout", end_toosing)
	label.text = str(_actualSide)

func get_actual_side() -> int:
	return _actualSide

func one_toss():
	label.text = ''
	_actualSide = randi_range(1, _numberOfSides)
	label.text = str(_actualSide)
	dice_changed_side.emit()

func end_toosing():
	timer_dice_one_side_change.stop()
	dice_stopped_changing_sides.emit()

func toss_a_dice() -> void:
	timer_whole_roll.start()
	timer_dice_one_side_change.start()
	#await timer_whole_roll.timeout


func change_number_of_sides(new_number_of_sides):
	assert(new_number_of_sides>3, "Number of sides cannot be less then 4!")
	_numberOfSides = new_number_of_sides

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
