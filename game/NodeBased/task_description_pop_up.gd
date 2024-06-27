extends Panel

@onready var label = %Label
@onready var animation_player = $AnimationPlayer
@onready var close_button = %"Close Button"
@onready var background_button = %"Background Button"



func show_popup():
	animation_player.play("move_in")
	

func hide_popup():
	animation_player.play("move_out")


func change_description(description: String):
	label.text = description


func _ready():
	background_button.connect('pressed', hide_popup)
	close_button.connect("button_up", hide_popup)
	hide()


func _process(delta):
	pass
