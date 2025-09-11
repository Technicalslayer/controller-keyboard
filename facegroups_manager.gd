extends Node

var greatest_angle # if calc angle is greater than this, it will be in the first group
@export
var facegroups: Array[FaceGroupData]

func _ready():
	_read_facegroup_from_file() # temp?


# returns array of lower and upper angle bounds. (lower angle=x, upper angle=y)
func _calculate_face_group_angles(num_groups) -> Array:
	var group_angle_size = 2*PI/num_groups
	var group_offset = group_angle_size/2 # used to "center" group so first group middle is at 0 degrees
	greatest_angle = (2*PI) - group_offset
	
	var group_angles: Array
	for i in num_groups:
		#x = lower, y = upper limit angle
		var temp_angles = Vector2.ZERO
		temp_angles.x = (group_angle_size * i) - group_offset
		temp_angles.y = (group_angle_size * i) + group_offset
		group_angles.append(temp_angles)
	return group_angles

func _read_facegroup_from_file():
	var file = FileAccess.open("res://face_groups.txt", FileAccess.READ)
	var content = file.get_as_text()
	var split_array = content.split(" ", false)
	var num_groups = ceili(split_array.size()/4.0)
	var group_modulo = split_array.size() % 4 # how many in the last incomplete group
	
	# get button info and angles
	var group_angles = _calculate_face_group_angles(num_groups)
	
	#maybe keep track of index i outside of loop to allow more flexible assignment for face groups
	# get complete groups
	var complete_groups = num_groups if group_modulo == 0 else num_groups-1
	for i in complete_groups:
		# get 4 each time
		var k = i * 4
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[k])
		var e = JKEnumHelper.Char_To_Key_Code.get(split_array[k+1])
		var s = JKEnumHelper.Char_To_Key_Code.get(split_array[k+2])
		var w = JKEnumHelper.Char_To_Key_Code.get(split_array[k+3])
		facegroups.append(FaceGroupData.new(group_angles[i], n, e, s, w))
	
	# get unfinished group
	if group_modulo == 3:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-4])
		var e = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-3])
		var s = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-2])
		facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n, e, s))
	if group_modulo == 2:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-4])
		var e = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-3])
		facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n, e))
	if group_modulo == 1:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-4])
		facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n))


func create_facegroup():
	# need to get the data for the face group
	pass
	# face group has 4 face buttons, an upper and lower angle
	# buttons are in an array? could just have 4 variables
	# each button holds a character and a direction that corresponds to N,E,S,W
	# don't need the direction on the button
	# input reads you pressed North Face, finds North Face Button from face group
	# button data just needs what character to output and maybe activation mode


func _select_face_group(joy_angle) -> FaceGroupData:
	# My math might be bad here, but Vector2.angle() returns negative values when
	#  over 1 PI. I can wrap all angles to positive, but this causes issues
	#  because of the offset I apply makes the first group have a negative lower
	#  bound and a positive upper bound. If the angle is greater than the last
	#  group's upper bound - which will always be positive - it has to be in 
	#  the first group
	if joy_angle < 0:
		# make positive
		joy_angle += 2*PI
	
	if joy_angle > $"../ControllerController".greatest_angle:
		print(str($"../ControllerController".face_groups[0].resource_name))
		return $"../ControllerController".face_groups[0]
	
	# iterate through all face groups to find where this angle is in
	for f in $"../ControllerController".face_groups:
		if f.group_angles.x <= joy_angle && f.group_angles.y > joy_angle:
			print(str(f.resource_name))
			return f
		
	return null
