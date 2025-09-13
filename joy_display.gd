extends Node2D

var current_device := 0
var cursor
@export
var distance_scale := 50.0
var number_of_groups = 8


func _ready():
	# connect to signal
	#Input.joy_connection_changed.connect(joypad_connected)
	cursor = $JoyCursor
	

#func joypad_connected(device, _connected):
	#current_device = device
	#cursor.position = Vector2.ZERO


func update_cursor(joy_input):
	cursor.position = joy_input.snapped(Vector2(0.01, 0.01)) * distance_scale


func update_grid(num_groups):
	number_of_groups = num_groups
	queue_redraw()


func _draw():
	var group_angle_size = 2*PI/number_of_groups
	var group_offset = group_angle_size/2 # used to "center" group so first group middle is at 0 degrees
	
	# draw temp grid
	draw_line(Vector2.DOWN * 100, Vector2.UP * 100, Color.GRAY, 1.0)
	draw_line(Vector2.LEFT * 100, Vector2.RIGHT * 100, Color.GRAY, 1.0)
	
	for i in number_of_groups:
		draw_line(Vector2.ZERO, Vector2.from_angle((group_angle_size * i) - group_offset) * 70.0, Color.BLACK, 4.0)
	
	draw_circle(Vector2.ZERO, 70.0, Color.BLACK, false, 4.0)
