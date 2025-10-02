extends Node2D

var current_device := 0
var cursor
@export
var distance_scale := 50.0
var number_of_groups = 8
var characterArray := PackedStringArray(["N","A"])
var font


func _ready():
	# connect to signal
	#Input.joy_connection_changed.connect(joypad_connected)
	cursor = $JoyCursor
	font = load("res://test_font.tres")

#func joypad_connected(device, _connected):
	#current_device = device
	#cursor.position = Vector2.ZERO


func update_cursor(joy_input):
	cursor.position = joy_input.snapped(Vector2(0.01, 0.01)) * distance_scale


func update_grid(num_groups, characters):
	number_of_groups = num_groups
	characterArray = characters
	queue_redraw()


func _draw():
	var group_angle_size = 2*PI/number_of_groups
	var group_offset = group_angle_size/2 # used to "center" group so first group middle is at 0 degrees
	
	# draw temp grid
	draw_line(Vector2.DOWN * 100, Vector2.UP * 100, Color(.75,.75,.75,0.5), 1.0)
	draw_line(Vector2.LEFT * 100, Vector2.RIGHT * 100, Color(.75,.75,.75,0.5), 1.0)
	var numCharsDrawn = 0
	#funny solution
	var directionArray = PackedVector2Array([Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT])
	for i in number_of_groups:
		draw_line(Vector2.ZERO, Vector2.from_angle((group_angle_size * i) - group_offset) * 70.0, Color.BLACK, 4.0)
		if(characterArray.size()>2):
			for j in 4:
				if numCharsDrawn < characterArray.size():
					#funny solution
					var charPos = (Vector2.from_angle(group_angle_size * i) * 50.0) + directionArray[j] * 10.0
					draw_char(font, charPos, characterArray[(i*4)+j], 15)
					#draw_char_outline(font, charPos, characterArray[(i*4)+j],15, -1, Color.BLACK)
					numCharsDrawn+=1
	
	draw_circle(Vector2.ZERO, 70.0, Color.BLACK, false, 4.0)
	
	#psuedo for drawing characters
	#for each group, draw the 4 characters in a clockwise fashion
	# offset center of character group from the edge of the middle of the angle range (just multiply by group_angle_size?)
	# north will be (Vector2.from_angle(group_angle_size * i) * offset from center) + Vector2.UP * distance from center of group
