extends Sprite2D

var current_device := 0
var cursor
@export
var distance_scale := 50.0

func _ready():
	# connect to signal
	Input.joy_connection_changed.connect(joypad_connected)
	cursor = $JoyCursor
	

func joypad_connected(device, _connected):
	current_device = device
	cursor.position = Vector2.ZERO


func _process(_delta):
	var left_joy_output = Vector2(Input.get_joy_axis(current_device,JOY_AXIS_LEFT_X),
	  Input.get_joy_axis(current_device, JOY_AXIS_LEFT_Y))
	
	cursor.position = left_joy_output.snapped(Vector2(0.01, 0.01)) * distance_scale
