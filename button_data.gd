class_name ButtonData
extends Button #extend something like 2d polygon and use pickable instead?

@export
var key_code: int = 0x41 # "A" by default
var activation_type_enum # rename this
var button_radius = 10.0
var input_display
var listening = false
#signal button_clicked
signal button_assigned(input_value)

func _unhandled_input(event):
	if listening:
		if event is InputEventMouseButton:
			button_assigned.emit(event)
		if event is InputEventKey:
			button_assigned.emit(event)

func _init(_key_code = 0x41, _activation_type_enum = 0):
	key_code = _key_code
	activation_type_enum = _activation_type_enum


func _ready():
	text = ""
	queue_redraw()
	#connect signal
	connect("mouse_entered", _mouse_entered)
	connect("mouse_exited", _mouse_exited)
	
	input_display = get_node("/root/UIScene/InputPrompt")
	get_parent()
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


#func key_prompt() -> InputStruct:
	#var input : InputStruct
	#if Input.parse_input_event()
	#return input
	
func _pressed():
	#listen for user input
	
	# display prompt
	#button_clicked.emit()
	listening = true
	input_display.show()
	var value = await button_assigned
	print(str(value))
	if value is InputEventKey:
		var t = value.keycode
		t = JK_Enums.Key_Codes
		key_code = value.keycode
	if value is InputEventMouseButton:
		print("Not handled yet")
	listening = false
	input_display.hide()
	#var listening = true
	#while listening:
		#if Input.is_key_pressed(KEY_CTRL) and Input.is_key_pressed(KEY_C):
			#listening = false
			#input_display.hide()
			# do nothing
	# assign input to button after converting
	pass

func _mouse_entered():
	print("Entered Button: " + char(key_code))

func _mouse_exited():
	print("Exited Button: " + char(key_code))
