class_name ButtonData
extends Button

@export
var key_code: int = 0x41 # "A" by default
var activation_type_enum # rename this

func _init(_key_code = 0x41, _activation_type_enum = 0):
	key_code = _key_code
	activation_type_enum = _activation_type_enum


func _ready():
	text = ""
	queue_redraw()


func _change_key_code():
	
	# wait for user input
	queue_redraw()

func _draw():
	draw_circle(position, 10.0, Color.GRAY, true)
	draw_string(ThemeDB.fallback_font, position, char(key_code),HORIZONTAL_ALIGNMENT_CENTER)
