extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	connect("button_up", focus_off)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func focus_off():
	focus_exited()
