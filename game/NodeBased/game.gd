extends Control

@onready var dice_roller = %DiceRoller

@onready var dice_button = %DiceButton
@onready var description_button = %DescriptionButton
@onready var home_button = %HomeButton

@onready var tablet = %Tablet

@onready var task_name_pop_up = $"Task name pop up"
@onready var task_pop_up_timer = $"Task PopUp Timer"
@onready var task_description_pop_up = $"Task description pop up"


var shape_v = GLOBALS.number_of_rows
var shape_h = GLOBALS.number_of_columns

# Called when the node enters the scene tree for the first time.
func _ready():	
	initialize_game()


func findByClass(node: Node, className : String, result : Array) -> void:
	if node.is_class(className) :
		result.push_back(node)
	for child in node.get_children():
		findByClass(child, className, result)


func initialize_buttons():
	dice_button.focus_mode = 0
	var nodes = []
	findByClass(self, "Button", nodes)
	#print(nodes)
	for node in nodes:
		node.focus_mode = 0


func initialize_game():
	dice_roller.intitialize_dices(shape_v, shape_h)
	dice_roller.connect("two_sides_have_changed", rolling_dices_handler)
	dice_roller.connect("two_dices_have_stopped", dice_roller_stops_handler)
	
	tablet.change_tablet_shape(shape_v, shape_h)
	
	initialize_buttons()
	dice_button.connect("button_up", single_roll_handler)
	description_button.connect("button_up", description_pop_up_handler)
	home_button.connect("button_up", go_to_the_main_menu)
	description_button.disabled = true
	
	task_pop_up_timer.wait_time = 1.6 + 0.3 * 2
	task_pop_up_timer.connect('timeout', hide_task_popup)


func rolling_dices_handler():
	var first_dice_actual_side = dice_roller.get_dice_1_actual_side()
	var second_dice_actual_side = dice_roller.get_dice_2_actual_side()
	
	var cell = tablet.get_cell_by_row_and_and_column(first_dice_actual_side, second_dice_actual_side)
	#cell.read_cell()
	tablet.select_cell(cell)


func dice_roller_stops_handler():
	show_task_popup()


func show_task_popup():
	var cell = tablet.get_selected_cell()
	var task = cell.get_task()
	task_name_pop_up.change_task(task)
	task_name_pop_up.show_popup()
	task_pop_up_timer.start()
	
func hide_task_popup():
	task_name_pop_up.hide_popup()
	dice_button.disabled = false
	description_button.disabled = false


func single_roll_handler():
	dice_button.disabled = true
	description_button.disabled = true
	dice_roller.roll_dices()

func description_pop_up_handler():
	var cell = tablet.get_selected_cell()
	var description = cell.get_additional_description()
	task_description_pop_up.change_description(description)
	task_description_pop_up.show_popup()

func go_to_the_main_menu():
	get_tree().change_scene_to_file("res://game/NodeBased/main_menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
