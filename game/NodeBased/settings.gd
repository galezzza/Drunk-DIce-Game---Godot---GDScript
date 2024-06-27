extends Control

@onready var home_button = %HomeButton

@onready var number_of_rows_input = %"Number of rows input"
@onready var number_of_columns_input = %"Number of columns input"



# Called when the node enters the scene tree for the first time.
func _ready():
	home_button.connect("button_up", go_to_the_main_menu)
	number_of_rows_input.connect("text_submitted", number_of_rows_changed_handler)
	number_of_columns_input.connect("text_submitted", number_of_columns_changed_handler)
	
	number_of_rows_input.placeholder_text = str(GLOBALS.number_of_rows)
	number_of_columns_input.placeholder_text = str(GLOBALS.number_of_columns)


func go_to_the_main_menu():
	get_tree().change_scene_to_file("res://game/NodeBased/main_menu.tscn")


func number_of_rows_changed_handler(text):
	var number_of_rows = int(text)
	if (number_of_rows > 3) and (number_of_rows < 10):
		GLOBALS.number_of_rows = number_of_rows
	else:
		print("Input must be between 4 and 9")

func number_of_columns_changed_handler(text):
	var number_of_columns = int(text)
	if (number_of_columns > 3) and (number_of_columns <10):
		GLOBALS.number_of_columns = number_of_columns
	else:
		print("Input must be between 4 and 9")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
