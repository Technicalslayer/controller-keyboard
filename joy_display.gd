extends Node2D

var current_device := 0
var cursor
var display_radius := 100.0 # radius of joy display border
@export
var distance_scale := 50.0
var group_radius := 100.0 # center of face group, multiplied by angled vector
var offset_distance := 20.0 # how far from center of face group, in a cardinal direction
var number_of_groups = 8
var characterArray := PackedStringArray(["N","A"])
var font
var cur_collection: FacegroupCollection
var joy_deadzone: float = 0.0


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


#func update_grid(num_groups, characters):
	#number_of_groups = num_groups
	#characterArray = characters
	#queue_redraw()

func update_grid(collection: FacegroupCollection):
	cur_collection = collection
	number_of_groups = cur_collection.facegroups.size()
	characterArray = cur_collection.characterArray
	queue_redraw()


#iterate through facegroup, and each of their buttons with foreach
func _draw():
	var group_angle_size = 2*PI/number_of_groups
	var group_offset = group_angle_size/2 # used to "center" group so first group middle is at 0 degrees
	
	# draw temp grid
	draw_line(Vector2.DOWN * 125, Vector2.UP * 125, Color(.75,.75,.75,0.5), 1.0)
	draw_line(Vector2.LEFT * 125, Vector2.RIGHT * 125, Color(.75,.75,.75,0.5), 1.0)
	if cur_collection:
		for i in number_of_groups:
			draw_line(Vector2.ZERO, Vector2.from_angle((group_angle_size * i) - group_offset) 
					* display_radius, Color.BLACK, 4.0)
			if cur_collection.facegroups[i].north_button.activation_type_enum != -1:
				var charPos = ((Vector2.from_angle(group_angle_size * i) * group_radius) 
						+ Vector2.UP * offset_distance)
				charPos += position
				cur_collection.facegroups[i].north_button.global_position = charPos
				cur_collection.facegroups[i].north_button.redraw_button()
				#draw_char(font, charPos, characterArray[(i*4)], 15)
				#draw_char_outline(font, charPos, characterArray[(i*4)+j],15, -1, Color.BLACK)
				#button.pos = charPos
			if cur_collection.facegroups[i].east_button.activation_type_enum != -1:
				var charPos = ((Vector2.from_angle(group_angle_size * i) * group_radius) 
						+ Vector2.RIGHT * offset_distance)
				charPos += position
				cur_collection.facegroups[i].east_button.position = charPos
				cur_collection.facegroups[i].east_button.redraw_button()
			if cur_collection.facegroups[i].south_button.activation_type_enum != -1:
				var charPos = ((Vector2.from_angle(group_angle_size * i) * group_radius) 
						+ Vector2.DOWN * offset_distance)
				charPos += position
				cur_collection.facegroups[i].south_button.position = charPos
				cur_collection.facegroups[i].south_button.redraw_button()
			if cur_collection.facegroups[i].west_button.activation_type_enum != -1:
				var charPos = ((Vector2.from_angle(group_angle_size * i) * group_radius) 
						+ Vector2.LEFT * offset_distance)
				charPos += position
				cur_collection.facegroups[i].west_button.position = charPos
				cur_collection.facegroups[i].west_button.redraw_button()
				pass
	#var numCharsDrawn = 0
	##funny solution
	#var directionArray = PackedVector2Array([Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT])
	#for i in number_of_groups:
		#draw_line(Vector2.ZERO, Vector2.from_angle((group_angle_size * i) - group_offset) * 70.0, Color.BLACK, 4.0)
		#if(characterArray.size()>2):
			#for j in 4:
				#if numCharsDrawn < characterArray.size():
					##funny solution
					#var charPos = (Vector2.from_angle(group_angle_size * i) * 50.0) + directionArray[j] * 10.0
					#draw_char(font, charPos, characterArray[(i*4)+j], 15)
					##draw_char_outline(font, charPos, characterArray[(i*4)+j],15, -1, Color.BLACK)
					##button.pos = charPos
					#numCharsDrawn+=1
	
	draw_circle(Vector2.ZERO, display_radius, Color.BLACK, false, 4.0) #outline
	draw_circle(Vector2.ZERO, joy_deadzone, Color.DARK_RED, false, 1.0) #deadzone
	
	#psuedo for drawing characters
	#for each group, draw the 4 characters in a clockwise fashion
	# offset center of character group from the edge of the middle of the angle range (just multiply by group_angle_size?)
	# north will be (Vector2.from_angle(group_angle_size * i) * offset from center) + Vector2.UP * distance from center of group
