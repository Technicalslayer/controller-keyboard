extends Node

@export
var default_facegroups_file : String
@export
var file_dialog : FileDialog
#@export
#var facegroups: Array[FaceGroupData]
#var characterArray: PackedStringArray # all the characters being used in the face groups
var cur_collection
var cur_collection_index = 0
var cur_face_group: FaceGroupData = null
var current_device
var facegroups_collections: Array[FacegroupCollection]
var greatest_angle_temp = 0

@export
var joyDisplay: Node


func _ready():
	facegroups_collections.append(_read_facegroup_from_file())
	cur_collection = facegroups_collections[0]
	if joyDisplay:
		joyDisplay.update_grid(cur_collection.facegroups.size(), cur_collection.characterArray)
	# connect signals
	#Input.joy_connection_changed.connect(joypad_connected)
	if file_dialog:
		file_dialog.file_selected.connect(file_chosen)

func file_chosen(filePath):
	_read_facegroup_from_file(filePath)

#func joypad_connected(device, _connected):
	#current_device = device


#func _process(_delta):
	#var left_joy_output = Vector2(Input.get_joy_axis(current_device,JOY_AXIS_LEFT_X),
			#Input.get_joy_axis(current_device, JOY_AXIS_LEFT_Y))
	
	#_select_face_group(left_joy_output.angle())


# returns array of lower and upper angle bounds. (lower angle=x, upper angle=y)
func _calculate_face_group_angles(num_groups) -> Array:
	var group_angle_size = 2*PI/num_groups
	var group_offset = group_angle_size/2 # used to "center" group so first group middle is at 0 degrees
	greatest_angle_temp = (2*PI) - group_offset # don't know how to pass this cleanly
	
	var group_angles: Array
	for i in num_groups:
		#x = lower, y = upper limit angle
		var temp_angles = Vector2.ZERO
		temp_angles.x = (group_angle_size * i) - group_offset
		temp_angles.y = (group_angle_size * i) + group_offset
		group_angles.append(temp_angles)
	return group_angles


func _read_facegroup_from_file(text_file = default_facegroups_file) -> FacegroupCollection:
	var collection = FacegroupCollection.new()
	var file = FileAccess.open(text_file, FileAccess.READ)
	var content = file.get_as_text()
	content = content.trim_suffix("\n")
	var split_array = content.split(" ", false)
	collection.characterArray = split_array
	var num_groups = ceili(split_array.size()/4.0)
	print("split array size: %s" % [split_array.size()])
	var group_modulo = split_array.size() % 4 # how many in the last incomplete group
	
	# get button info and angles
	var group_angles = _calculate_face_group_angles(num_groups)
	collection.greatest_angle = greatest_angle_temp
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
		collection.facegroups.append(FaceGroupData.new(group_angles[i], n, e, s, w))
	
	# get unfinished group
	if group_modulo == 3:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-3])
		var e = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-2])
		var s = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-1])
		collection.facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n, e, s))
	if group_modulo == 2:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-2])
		var e = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-1])
		collection.facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n, e))
	if group_modulo == 1:
		var n = JKEnumHelper.Char_To_Key_Code.get(split_array[split_array.size()-1])
		collection.facegroups.append(FaceGroupData.new(group_angles[group_angles.size()-1], n))
	
	return collection

func create_facegroup():
	# need to get the data for the face group
	#joyDisplay.update_grid(facegroups.size())
	pass
	# face group has 4 face buttons, an upper and lower angle
	# buttons are in an array? could just have 4 variables
	# each button holds a character and a direction that corresponds to N,E,S,W
	# don't need the direction on the button
	# input reads you pressed North Face, finds North Face Button from face group
	# button data just needs what character to output and maybe activation mode


func select_face_group(joy_input) -> FaceGroupData:
	# My math might be bad here, but Vector2.angle() returns negative values when
	#  over 1 PI. I can wrap all angles to positive, but this causes issues
	#  because of the offset I apply makes the first group have a negative lower
	#  bound and a positive upper bound. If the angle is greater than the last
	#  group's upper bound - which will always be positive - it has to be in 
	#  the first group
	var joy_angle = joy_input.angle()
	if joy_angle < 0:
		# make positive
		joy_angle += 2*PI
	
	if joy_angle > cur_collection.greatest_angle:
		#print(str(facegroups[0].resource_name))
		return cur_collection.facegroups[0]
	
	# iterate through all face groups to find where this angle is in
	for f in cur_collection.facegroups:
		if f.group_angles.x <= joy_angle && f.group_angles.y > joy_angle:
			#print(str(f.resource_name))
			return f
		
	return null

func change_facegroup_collection():
	pass

func cycle_facegroup_collection():
	var new_index = cur_collection_index + 1
	if new_index >= facegroups_collections.size():
		new_index = 0
	cur_collection = facegroups_collections[new_index]
	if joyDisplay:
		joyDisplay.update_grid(cur_collection.facegroups.size(), cur_collection.characterArray)
