class_name ButtonData
extends Button #extend something like 2d polygon and use pickable instead?

@export
var key_code: int = 0x41 # "A" by default
var activation_type_enum # rename this
var button_radius = 10.0

func _init(_key_code = 0x41, _activation_type_enum = 0):
	key_code = _key_code
	activation_type_enum = _activation_type_enum


func _ready():
	text = ""
	queue_redraw()
	#connect signal
	connect("mouse_entered", _mouse_entered)
	connect("mouse_exited", _mouse_exited)
	size = Vector2(button_radius * 2, button_radius * 2)
	


func _change_key_code():
	
	# wait for user input
	queue_redraw()

func _draw():
	draw_circle(Vector2.ONE * button_radius, button_radius, Color.GRAY, true)
	#draw_string(ThemeDB.fallback_font, Vector2.ONE * button_radius,
			 #char(key_code),HORIZONTAL_ALIGNMENT_CENTER)
	draw_char(ThemeDB.fallback_font, Vector2(button_radius/2.0, button_radius + button_radius/2.0),
			 char(key_code))

func redraw_button():
	queue_redraw()
	position = position - (Vector2.ONE * button_radius)


func _pressed():
	print(char(key_code))

func _mouse_entered():
	print("Entered Button: " + char(key_code))

func _mouse_exited():
	print("Exited Button: " + char(key_code))
