class_name FaceGroupData
extends Resource

# face buttons
@export
var north_button: ButtonData
@export
var east_button: ButtonData
@export
var south_button: ButtonData
@export
var west_button: ButtonData

var group_angles: Vector2 = Vector2(0.0, PI/4)


func _init(
		_group_angles = Vector2(0.0, PI/4),
		_north_key = 0x41, _east_key = 0x41, _south_key = 0x41, _west_key = 0x41, 
		_n_activation = 0, _e_activation = 0, _s_activation = 0, _w_activation = 0 
):
	group_angles = _group_angles
	north_button = ButtonData.new(_north_key, _n_activation)
	east_button = ButtonData.new(_east_key, _e_activation)
	south_button = ButtonData.new(_south_key, _s_activation)
	west_button = ButtonData.new(_west_key, _w_activation)
