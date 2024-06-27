extends Button

@onready var label = %Label

var _task: String = 'BASE TASK'
var _additional_description: String = 'BASE DESCRIPTION'

func get_task():
	return _task

func get_additional_description():
	return _additional_description
	
func read_cell():
	var output = "Task: " + get_task() + "\nDescription: " +get_additional_description()
	print(output)
	print()

func update_from_cell_object(cell_object: Cell_Statistic):
	_task = cell_object.get_task()
	_additional_description = cell_object.get_additional_description()	


func override_color(theme_name: String, color: String):
	var stylebox = get_theme_stylebox(theme_name) as StyleBoxFlat
	var stylebox_copy = stylebox.duplicate()
	stylebox_copy.bg_color = color
	add_theme_stylebox_override(theme_name, stylebox_copy)


func select():
	override_color('normal', 'D9EDFC')
	override_color('hover', 'D9EDFC')
	override_color('pressed', 'D9EDFC')
	override_color('focus', 'E1F1FD')
	


func deselect():
	override_color('normal', "FFFFFF")
	override_color('hover', 'F3F9FE')
	override_color('pressed', 'F3F9FE')
	override_color('focus', 'F3F9FE')

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(_task)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
