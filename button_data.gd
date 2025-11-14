class_name ButtonData
extends Button #extend something like 2d polygon and use pickable instead?



@export
var key_code: int = 0x41 # "A" by default
var unicode: int = 0x0041 # "A" by default
var input_type = JK_Enums.Input_Types.UNICODE
#var key_code_display = 0x41 # what joyDisplay uses, as godot's keycodes may be different from the OS
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
			# somehow check if shift is held? and only assign shift if it's released by itself
			button_assigned.emit(event)

func _init(_key_code = 0x41, _activation_type_enum = 0):
	#key_code = _key_code
	unicode = _key_code
	#key_code_display = _key_code
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
	if input_type == JK_Enums.Input_Types.UNICODE:
		draw_char(ThemeDB.fallback_font, Vector2(button_radius/2.0, button_radius + button_radius/2.0),
			 	char(unicode))
	elif input_type == JK_Enums.Input_Types.MOUSE:
		draw_line(Vector2(button_radius/2.0, button_radius/2.0), Vector2(button_radius, button_radius),
				Color.GRAY)
	elif input_type == JK_Enums.Input_Types.KEY_CODE:
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
		#var t = JKEnumHelper.godot_vK_to_windows_vK.get(value.keycode)
		if value.unicode != 0:
			# has valid unicode representation
			input_type = JK_Enums.Input_Types.UNICODE
			unicode = value.unicode
			print(unicode)
		else:
			# not a character, probably a special key like tab or shift
			input_type = JK_Enums.Input_Types.KEY_CODE
			key_code = value.keycode
			print(key_code)
		#print(t)
		#print(JKEnumHelper.godot_vK_to_windows_vK.has(t))
		# convert keycode from godot to keycode in windows
		# need character or scan code to convert
		# alternatively, can make a mapping in godot, but that's tedious
		#key_code = t
		#key_code_display = value.keycode
	if value is InputEventMouseButton:
		print("Not handled yet")
		input_type = JK_Enums.Input_Types.MOUSE
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
	if input_type == JK_Enums.Input_Types.UNICODE:
		print("Entered Button: " + char(unicode))
	elif input_type == JK_Enums.Input_Types.KEY_CODE:
		print("Exited Button: " + char(key_code))


func _mouse_exited():
	if input_type == JK_Enums.Input_Types.UNICODE:
		print("Exited Button: " + char(unicode))
	elif input_type == JK_Enums.Input_Types.KEY_CODE:
		print("Exited Button: " + char(key_code))
