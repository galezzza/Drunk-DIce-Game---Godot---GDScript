extends Control

@onready var play = $PanelContainer/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Play
@onready var settings = %Settings
@onready var exit = %Exit

func _ready():
	play.focus_mode = 0
	settings.focus_mode = 0
	exit.focus_mode = 0
	play.connect("button_up", start_the_game)
	settings.connect("button_up", go_to_the_settings)
	exit.connect("button_up", exit_the_game)


func start_the_game():
	get_tree().change_scene_to_file("res://game/NodeBased/game.tscn")


func go_to_the_settings():
	get_tree().change_scene_to_file("res://game/NodeBased/settings.tscn")

func exit_the_game():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
