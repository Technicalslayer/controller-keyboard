class_name FaceGroupData
extends Node2D

# face buttons
#@export
var north_button: ButtonData
#@export
var east_button: ButtonData
#@export
var south_button: ButtonData
#@export
var west_button: ButtonData

var group_angles: Vector2 = Vector2(0.0, PI/4)


# the activation parameters show -1 if the button shouldn't be visible or funcitonal
# it defaults to -1 and must be changed when initializing or errors may occur
# using 0 as no other values do anything
# 0x41 is the default key_code, it represents the letter 'a'
func _init(
		_group_angles = Vector2(0.0, PI/4),
		_north_key = 0x41, _east_key = 0x41, _south_key = 0x41, _west_key = 0x41, 
		_n_activation = -1, _e_activation = -1, _s_activation = -1, _w_activation = -1 
):
	group_angles = _group_angles
	north_button = ButtonData.new(_north_key, _n_activation)
	add_child(north_button)
	east_button = ButtonData.new(_east_key, _e_activation)
	add_child(east_button)
	south_button = ButtonData.new(_south_key, _s_activation)
	add_child(south_button)
	west_button = ButtonData.new(_west_key, _w_activation)
	add_child(west_button)
