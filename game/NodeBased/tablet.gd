extends PanelContainer

@onready var grid_container = $MarginContainer/GridContainer

var _vertical_number_of_cell: int = 6
var _horizotal_number_of_cell: int = 6

var _selected_cell = null


# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize_tablet()


func _initialize_tablet():
	grid_container.columns = _horizotal_number_of_cell
	remove_previous_cells()
	var number_of_cells = calculate_number_of_cells()
	initialize_cells(number_of_cells)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_horizotal_number_of_cell():
	return _horizotal_number_of_cell

func get_vertical_number_of_cell():
	return _vertical_number_of_cell
	
func get_tablet_shape():
	return Vector2(get_vertical_number_of_cell(), get_horizotal_number_of_cell())


func calculate_number_of_cells():
	return _vertical_number_of_cell * _horizotal_number_of_cell

func _initialize_cell_object_container():
	var list_of_tasks_indexes = GLOBALS.CELL_STATISTIC_ENUM.values()
	var number_of_cells = calculate_number_of_cells()
	
	assert(list_of_tasks_indexes.size() >= number_of_cells, "Number of task is not enough to fill tablet!")
	
	list_of_tasks_indexes.shuffle()
	var cell_container = []
	for i in range(number_of_cells):	
		var chosen_task_index = list_of_tasks_indexes.pop_front()
		var chosen_task = GLOBALS.CREATE_CELL_WITH_STATISTIC(chosen_task_index)
		cell_container.append(chosen_task)
	return cell_container

func remove_previous_cells():
	var gridContainer = get_node("MarginContainer/GridContainer")
	var previous_cells = gridContainer.get_children(false)
	for i in range(len(previous_cells)):
		previous_cells[i].queue_free()

func _create_cell_node():
	var cell_scene = load('res://game/NodeBased/cell.tscn')
	var cell_instance = cell_scene.instantiate()
	return cell_instance
	
func _connect_cell_node_to_grid(cell_instance):
	var gridContainer = get_node("MarginContainer/GridContainer")
	gridContainer.add_child(cell_instance)
	
func initialize_cells(number_of_cells):
	var cell_object_container = _initialize_cell_object_container()
	for i in range(number_of_cells):
		var cell_instance = _create_cell_node()
		
		var cell_object = cell_object_container[i]
		cell_instance.update_from_cell_object(cell_object)
		
		_connect_cell_node_to_grid(cell_instance)
		

func change_tablet_shape(new_vertical_number_of_cell, new_horizotal_number_of_cell):
	_vertical_number_of_cell = new_vertical_number_of_cell 
	_horizotal_number_of_cell = new_horizotal_number_of_cell
	_initialize_tablet()
	

func get_cell_by_row_and_and_column(row_index, column_index):
	assert(row_index <= _vertical_number_of_cell, "Incorrect row index")
	assert(column_index <= _horizotal_number_of_cell, "Incorrect column index")
	var cell_index = (row_index - 1) * _horizotal_number_of_cell + (column_index - 1)
	var cell = grid_container.get_child(cell_index)
	return cell
	
func select_cell(cell):
	if is_instance_valid(_selected_cell):
		_selected_cell.deselect()
	_selected_cell = cell
	_selected_cell.select()
	

func get_selected_cell():
	return _selected_cell


