extends Node

var current_device := 0 # device ID
var inputEmulator : InputEmulator
var joyDisplay
var facegroupsManager
var cur_facegroup = null
var gyro_enabled = true
var gyro_sens = 50.0
var left_joy_deadzone = 0

func _ready() -> void:
	Input.joy_connection_changed.connect(joypad_connected)
	inputEmulator = InputEmulator.new()
	
	# connect buttons
	$Calibrate.pressed.connect(func() -> void:
		Input.start_joy_motion_calibration(current_device)
		#$CalibrationInProgress.show()
		for i in 50:
			Input.step_joy_motion_calibration(current_device)
			await get_tree().create_timer(0.05).timeout
		Input.stop_joy_motion_calibration(current_device)
		#$CalibrationInProgress.hide()
		)
	
	$ResetCalibration.pressed.connect(func() -> void:
		Input.clear_joy_motion_calibration(current_device)
		)
	
	$ColorPickerButton.color_changed.connect(color_picker_helper.bind(current_device))
	
	# look for other components
	joyDisplay = $JoyDisplay
	facegroupsManager = $FacegroupsManager


func joypad_connected(device: int, connected: bool) -> void:
	if not connected:
		$ConnectedCheck.button_pressed = false # device connected
		$AccelCheck.button_pressed = false # has accelerometer
		$GyroCheck.button_pressed = false # has gyrometer
		$LightCheck.button_pressed = false # has LED support
		$ColorPickerButton.disabled = true # allows selecting LED color
		$GyroToggle.button_pressed = false
		return
		
	current_device = device
	$ConnectedCheck.button_pressed = true
	$JoyName.text = "Gamepad name: " + Input.get_joy_name(current_device)
	
	# check for sensors/extra features
	if Input.has_joy_accelerometer(current_device):
		Input.set_joy_accelerometer_enabled(current_device, true)
		$AccelCheck.button_pressed = true
		
	if Input.has_joy_gyroscope(current_device):
		Input.set_joy_gyroscope_enabled(current_device, true)
		$GyroCheck.button_pressed = true
		
	if Input.has_joy_light(current_device):
		$LightCheck.button_pressed = true
		$ColorPickerButton.disabled = false
	
	# Device Info
	#$Model.text = "Model: " + str(Input.get_joy_model(current_device))
	#$Scheme.text = "Scheme: " + str(Input.get_joy_scheme(current_device))
	#$DeviceType.text = "Device type: " +  str(Input.get_joy_device_type(current_device))
	#$PowerState.text = "Power state: " + str(Input.get_joy_power_state(current_device))
	#$ConnectionState.text = "Connection state: " + str(Input.get_joy_connection_state(current_device))
	#$BatteryPercent.text = "Battery percent: " + str(Input.get_joy_battery_percent(current_device))


func _process(_delta: float) -> void:
	if Input.has_joy_accelerometer(0):
		$AccelValue.text = "%s" % Input.get_joy_accelerometer(0)
		$Gravity.text = "Gravity: %s" % Input.get_joy_gravity(0)
	if Input.has_joy_gyroscope(0):
		$GyroValue.text = "%s" % Input.get_joy_gyroscope(0)
	#$SensorRate.text = "Sensor rate: " + str(Input.get_joy_sensor_rate(0))

	
	#if Input.is_joy_motion_calibrated(current_device):
		#$ColorRect.position.x += Input.get_joy_gyroscope(0).y * 5
		#$ColorRect.position.y += Input.get_joy_gyroscope(0).x * 5
		#$ColorRect2.position.x += Input.get_joy_accelerometer(0).x * 5
		#$ColorRect2.position.y += Input.get_joy_accelerometer(0).y * 5
	#region input
	
	var left_joy_output = Vector2(Input.get_joy_axis(current_device,JOY_AXIS_LEFT_X),
	Input.get_joy_axis(current_device, JOY_AXIS_LEFT_Y))
	var right_joy_output = Vector2(Input.get_joy_axis(current_device,JOY_AXIS_RIGHT_X), 
	Input.get_joy_axis(current_device, JOY_AXIS_RIGHT_Y))
	#print(str(left_joy_output.snapped(Vector2(0.1, 0.1))))
	
	
	if joyDisplay:
		if left_joy_output.length() > 0.1:
			joyDisplay.update_cursor(left_joy_output)
		else:
			joyDisplay.update_cursor(Vector2.ZERO)
	if facegroupsManager:
		#print(left_joy_output)
		cur_facegroup = facegroupsManager.select_face_group(left_joy_output, left_joy_deadzone)
	
	# check buttons
	if cur_facegroup:
		if Input.is_action_just_pressed("north_face"):
			#print(str(cur_facegroup.north_button.key_code))
			if cur_facegroup.north_button.input_type == JK_Enums.Input_Types.UNICODE:
				inputEmulator.single_unicode_press_and_release(cur_facegroup.north_button.unicode)
			elif cur_facegroup.north_button.input_type == JK_Enums.Input_Types.KEY_CODE:
				inputEmulator.single_key_press_and_release(cur_facegroup.north_button.key_code)
		if Input.is_action_just_pressed("east_face"):
			#print(str(cur_facegroup.east_button.key_code))
			if cur_facegroup.east_button.input_type == JK_Enums.Input_Types.UNICODE:
				inputEmulator.single_unicode_press_and_release(cur_facegroup.east_button.unicode)
			elif cur_facegroup.east_button.input_type == JK_Enums.Input_Types.KEY_CODE:
				inputEmulator.single_key_press_and_release(cur_facegroup.east_button.key_code)
		if Input.is_action_just_pressed("west_face"):
			#print(str(cur_facegroup.west_button.key_code))
			if cur_facegroup.west_button.input_type == JK_Enums.Input_Types.UNICODE:
				inputEmulator.single_unicode_press_and_release(cur_facegroup.west_button.unicode)
			elif cur_facegroup.west_button.input_type == JK_Enums.Input_Types.KEY_CODE:
				inputEmulator.single_key_press_and_release(cur_facegroup.west_button.key_code)
		if Input.is_action_just_pressed("south_face"):
			#print(str(cur_facegroup.south_button.key_code))
			if cur_facegroup.south_button.input_type == JK_Enums.Input_Types.UNICODE:
				inputEmulator.single_unicode_press_and_release(cur_facegroup.south_button.unicode)
			elif cur_facegroup.south_button.input_type == JK_Enums.Input_Types.KEY_CODE:
				inputEmulator.single_key_press_and_release(cur_facegroup.south_button.key_code)
	else:
		# no face group selected
		if Input.is_action_just_pressed("south_face"):
			inputEmulator.single_key_press_and_release(JK_Enums.Key_Codes.VK_SPACE)
		if Input.is_action_just_pressed("west_face"):
			inputEmulator.single_key_press_and_release(JK_Enums.Key_Codes.VK_BACK)
	
	# hardcoded backspace for now. Want to be able to hold it
	if Input.is_action_just_pressed("back"):
		inputEmulator.single_key_press_and_release(JK_Enums.Key_Codes.VK_BACK)
	
	# hardcoded shift for now
	if Input.is_action_just_pressed("left_bumper"):
		inputEmulator.single_key_press_and_release(JK_Enums.Key_Codes.VK_SHIFT)
	#if Input.is_action_just_released("left_bumper"): 
		#inputEmulator.single_key_press_and_release(JK_Enums.Key_Codes.VK_CONTROL)
	
	# later add functionality to face buttons when no joystick deflection
	if Input.is_action_just_pressed("right_bumper"):
		facegroupsManager.cycle_facegroup_collection()
	
	if Input.is_action_just_pressed("right_trigger"):
		inputEmulator.mouse_left_down()
	
	if Input.is_action_just_released("right_trigger"):
		inputEmulator.mouse_left_up()

	if gyro_enabled and Input.has_joy_gyroscope(0):
		var gyroVec = Input.get_joy_gyroscope(0)
		inputEmulator.mouse_move(Vector2(gyroVec.y, gyroVec.x) * gyro_sens)
	
	if right_joy_output.length() > 0.1:
		inputEmulator.mouse_move(right_joy_output * gyro_sens)
	
	#endregion


# clunky, but swaps param order cuz of shenanigans with bind and emit
# bind's parameters are placed after emit's
func color_picker_helper(color: Color, cur_dev : int):
	Input.set_joy_light(cur_dev, color)
	print("Set color to %s" % [color])


func _on_gyro_toggle_toggled(toggled_on):
	gyro_enabled = toggled_on


func _on_reset_calibration_pressed():
	Input.start_joy_motion_calibration(0)
	# Send 50 calibration samples in 2.5 seconds
	for i in 50:
		Input.step_joy_motion_calibration(0)
		await get_tree().create_timer(0.05).timeout
	Input.stop_joy_motion_calibration(0)
	# The joypad is now calibrated



func _on_select_file_pressed():
	$FileDialog.show()


func _on_deadzone_slider_value_changed(value):
	left_joy_deadzone = value
	if joyDisplay:
		joyDisplay.joy_deadzone = value
		joyDisplay.queue_redraw()
