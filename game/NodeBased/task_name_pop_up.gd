extends PanelContainer

@onready var label = %Label
@onready var animation_player = $AnimationPlayer


func show_popup():
	animation_player.play("fade_in")


func hide_popup():
	animation_player.play("fade_out")


func change_task(task: String):
	label.text = task


func _ready():
	hide()


func _process(delta):
	pass
